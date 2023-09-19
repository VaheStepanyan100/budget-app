Rails.application.routes.draw do
  get 'static_pages/splash'
  root 'static_pages#splash'
  resources :categories do
    resources :purchases, only: [:new, :show]
  end
  resources :purchases, except: [:new, :show, :index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
