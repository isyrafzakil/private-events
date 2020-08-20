Rails.application.routes.draw do
  devise_for :users
	root to: 'users#index'
	resources :users
  get 'users/new'
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
