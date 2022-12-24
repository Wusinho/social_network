Rails.application.routes.draw do
  resources :todos
  resources :profiles
  devise_for :users
  resource :homes
  resources :invitations
  root 'todos#index'
  post 'invitations/:id/active' => 'invitations#active', as: :complete_invitation
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
