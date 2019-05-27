Rails.application.routes.draw do
  devise_for :users
  get 'walls/show'
  get 'sites/show'
  get 'trips/new'
  get 'trips/create'
  get 'trips/show'
  get 'trips/destroy'
  get 'trips/edit'
  get 'trips/update'
  get 'users/show'
  get 'routes/new'
  get 'routes/create'
  get 'routes/index'
  get 'routes/show'
  get 'routes/destroy'
  get 'routes/edit'
  get 'routes/update'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'reviews/edit'
  get 'reviews/update'
  get 'route/new'
  get 'route/create'
  get 'route/index'
  get 'route/show'
  get 'route/destroy'
  get 'route/edit'
  get 'route/update'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home', to: 'pages#home', as: :home
end

