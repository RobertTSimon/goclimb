Rails.application.routes.draw do
  devise_for :users

resources :routes

resources :reviews

resources :trips

resources :sites, only: [:show]
resources :walls, only: [:show]

root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

