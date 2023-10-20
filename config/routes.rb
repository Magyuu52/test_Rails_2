Rails.application.routes.draw do
  get 'reservations/index'

  get 'rooms/index'

  get '/' => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :only => [:new, :create, :edit, :update]
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  get 'users/account' => 'users#account'
  get 'users/profile' => 'users#profile'
end
