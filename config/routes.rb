Rails.application.routes.draw do
  get 'event_attendances/index'
  get 'event_attendances/show'

  devise_for :users

	root to: 'users#index'

	resources :users

  resources :events
	resources :events, only: [:index, :show] do
    member do
      post 'events/:id/add_attendee', to: "events#add_attendee"
      delete 'events/:id/remove_attendee', to: "events#remove_attendee"
    end
  end

  resources :event_attendances
  
end
