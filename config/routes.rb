Studiocracy::Application.routes.draw do
  root "pages#home"
  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }
  get "comments/reply" => "comments#reply", as: :comments_reply
  resources :charges
  resources :users
  
  resources :posts do
    member do
      put "like", to: "posts#like"
      put "unlike", to: "posts#unlike"
    end
  end
  
  resources :comments, :only => [:create, :destroy]
  resources :comments do
    member do
      put "like", to: "comments#like"
      put "unlike", to: "comments#unlike"
      put "dislike", to: "comments#dislike"
      put "undislike", to: "comments#undislike"
    end
  end

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  get "/about", to: "pages#about", as: "about"
  get "/privacy", to: "pages#privacy", as: "privacy"
  get "/terms", to: "pages#terms", as: "terms"
  get "/our_team", to: "pages#our_team", as: "our_team"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  # Studiocracy API
  namespace :api do
    namespace :posts do
      resources :posts
    end
    namespace :users do
      resources :users
    end
  end

  namespace :admin do
    resources :posts
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
  end

end
