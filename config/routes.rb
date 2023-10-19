Rails.application.routes.draw do
  get 'reservations/index'

  get 'rooms/index'

  get '/' => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get 'users/about' => 'users#about'  
end
