Rails.application.routes.draw do
  get 'users/update_user'
  post 'users/uploadMetadata'
  resources :events
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
