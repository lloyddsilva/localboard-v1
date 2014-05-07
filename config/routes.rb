LocalboardV1::Application.routes.draw do
  resources :post_categories

  resources :posts

  resources :locations

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end