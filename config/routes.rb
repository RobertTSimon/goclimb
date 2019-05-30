Rails.application.routes.draw do
  devise_for :users

	resources :routes do
	  resources :reviews, only: [:new, :index, :create, :show]
	end
	resources :trips
  get "/trips/update/:id", to: "trips#update", as: :trip_update
	resources :reviews, only: [:destroy]


	resources :sites, only: [:show] do
	  resources :reviews
	end
	resources :users, only: [:show]

	root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

