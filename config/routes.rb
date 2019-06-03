Rails.application.routes.draw do
  get 'route_trips/destroy'
  #as per Le Wagon tutorial to implement the follow/unfollow feature
  devise_for :users
  resources :pages, only: [:home, :profile]
  resources :users, only: [:show]

	resources :routes do
	  resources :reviews, only: [:new, :index, :create, :show]
	end

	resources :trips, only: [:show] do
    resources :routes, only: [:show] do
      get 'delete', to: "trips#delete", as: :trip_delete
    end
  end


  get "/trips/update/:id", to: "trips#update", as: :trip_update
  # get "/trips/delete/:id", to: "trips#delete", as: :trip_delete
	resources :reviews, only: [:destroy]

	resources :sites, only: [:show] do
	  resources :reviews
	end

	resources :users, only: [:show, :update, :edit]

	root to: 'pages#home'
  get 'profile/:id', to: 'pages#profile', as: :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'add_follower/:id', to: 'pages#add_follower', as: :add_follower
  get 'delete_follower/:id', to: 'pages#delete_follower', as: :delete_follower

end

