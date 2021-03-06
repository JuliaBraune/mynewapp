Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => 'user_registrations'}
  
  resources :users

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  post 'payments/create'

  root 'static_pages#landing_page'
end