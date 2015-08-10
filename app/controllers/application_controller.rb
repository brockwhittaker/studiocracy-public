class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reject_locked!, if: :devise_controller?
  after_filter :store_location

  # Devise permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
        :email,
        :password,
        :password_confirmation)
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
        :email,
        :password,
        :password_confirmation,
        :current_password
    )
    }
  end

  #for use in redirecting upon successful login
  def store_location
    return unless request.get?
    #save sites not on this exclusion list
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/edit")
      session[:previous_url] = request.fullpath
    end
  end

  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      user_session = nil
      current_user = nil
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!

  # Only permits admin users
  def require_admin!
    authenticate_user!

    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!

  #helper method for mailboxer
  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

end