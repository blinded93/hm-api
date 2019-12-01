Rails.application.routes.draw do
	post '/auth_user' => 'authentication#authenticate_user'
	post '/verify_user' => 'authentication#verify_user'
  resources :users
  resources :expenses
  resources :items
  resources :tasks
  resources :lists
  resources :properties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
