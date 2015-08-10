class User < ActiveRecord::Base

devise :omniauthable


  #For Mailboxer private inboxes
  acts_as_messageable
  acts_as_voter
  
  def mailboxer_name
    self.fullname
  end

  def mailboxer_email(object)
    self.email
  end
  
  # Relations
  has_many :posts

  has_attached_file :image,
                    styles: { small: "64x64", med: "300x300", large: "500x500" },
                    :default_url => 'default_icon.jpg'
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  extend FriendlyId
  friendly_id :fullname, use: :slugged


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
# Confirmation email disabled due to timeout errors with our host
  
  # Pagination
  paginates_per 100

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # :password
  validate :password_complexity

  def password_complexity
    if (provider != "facebook")
      if not (password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/) or password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%\^&\*\(\)_\+\|~\-=\\\'\{}\[\]:";<>\?,\.\/])/))
        errors.add :password, "must include at least one lowercase letter, one uppercase letter, and either a number or special symbol !@#\$%\^&\*\(\)_\+\|~\-=\\\'\{}\[\]:\";<>\?,\.\/"
      end
    end
  end

  def self.paged(page_number)
    order(admin: :desc, email: :asc).page page_number
  end

  def self.search_and_order(search, page_number)
    if search
      where("email LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, email: :asc
      ).page page_number
    else
      order(admin: :desc, email: :asc).page page_number
    end
  end

  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","email","created_at")
  end

  def self.last_signins(count)
    order(last_sign_in_at:
    :desc).limit(count).select("id","email","last_sign_in_at")
  end

  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    #user.uid = auth.uid
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.full_name = auth.info.name
    #user.city =
    #user.state =

    #user.image = auth.info.image
    user.email = auth.info.email
    user.password= "test123Ah!"
    user.save!
    #user.bio = auth.info.extra.raw_info.bio
    #user.oauth_token = auth.credentials.token
    #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.password = auth.uid

    user.skip_confirmation!
    user.save!
    end
  end
end
