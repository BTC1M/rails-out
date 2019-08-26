Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  devise_for :users


  resources :user_styles, only: [:create, :destroy]

  resources :artists, only: [:show, :upvote, :unvote] do
    member do
      put "like" => "artists#upvote"
      put "unlike" => "artists#unvote"
    end
  end

  resources :events, only: [:index, :show] do
    resources :user_participations, only: [:create, :destroy]
    resources :artist_participations, only: [:create, :destroy]
  end

  get "/dashboard", to: "pages#dashboard"
  get "/discover", to: "pages#discover"

  get "/modalsignin" => 'pages#modalsignin', :as => :modalsignin

end
