Rails.application.routes.draw do
  devise_for :users

resources :routes do
  resources :reviews
end
resources :trips


resources :sites, only: [:show] do
  resources :reviews
end

root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

