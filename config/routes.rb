Rails.application.routes.draw do
  get '/' => 'home#top'

  get 'reservations/index'

  get 'rooms/search' => 'rooms#search'
  get 'rooms/index' => 'rooms#index'
  get 'rooms/new' => 'rooms#new'
  post 'rooms/create' => 'rooms#create'
  resources :rooms, only: [:show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users/account/update' => 'users#update'
  get 'users/account/edit' => 'users#edit'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/account' => 'users#account'
  get 'users/profile' => 'users#profile'
  post 'users/create' => "users#create"
  get 'users/signup' => 'users#new'
end
