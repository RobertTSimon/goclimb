Rails.application.routes.draw do
  #as per Le Wagon tutorial to implement the follow/unfollow feature
  devise_for :users
  resources :pages, only: [:home, :profile] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :users, only: [:show]

	resources :routes do
	  resources :reviews, only: [:new, :index, :create, :show]
	end
	resources :trips
	resources :reviews, only: [:destroy]

	resources :sites, only: [:show] do
	  resources :reviews
	end

	root to: 'pages#home'
  get 'profile/:id', to: 'pages#profile', as: :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'add_follower/:id', to: 'pages#add_follower', as: :add_follower

end

