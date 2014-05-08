LocalboardV1::Application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/help'

  get 'pages/media'

  get 'pages/contact'

  resources :post_categories

  resources :posts

  resources :locations

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "pages#home"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  devise_scope :user do
    get "register", :to => "devise/registrations#new", :as => :register
    get "login", :to => "devise/sessions#new", :as => :login
    get "logout", :to => "devise/sessions#destroy", :as => :logout
  end
end