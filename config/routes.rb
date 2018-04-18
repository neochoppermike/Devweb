Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}, path: '', path_names: { sign_in: 'login', sign_out: 'logout', signup: 'sign_up' }
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
  resources :comments  
  end
  # nested resource because user reviews are associates with a specific product and so "comments" resources will be a subset of "products".
  
  resources :users

  post 'payments/create'

  get '/square-image.png'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  root 'static_pages#index'

end


