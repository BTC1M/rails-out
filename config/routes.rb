Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  devise_for :users

  resources :places
  resources :artists


  resources :events do
    resources :user_participations, only: [:new, :create, :destroy]
    resources :artist_participations, only: [:new, :create, :destroy]
  end

  get "/dashboard", to:"pages#dashboard"

end
