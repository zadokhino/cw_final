Rails.application.routes.draw do
  devise_for :users
	root 'places#index'
  resources :places
  resources :categories
  resources :ratings
  resources :photos
end
