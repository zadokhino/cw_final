Rails.application.routes.draw do
	root 'places#index'
  resources :places
  resources :categories
end
