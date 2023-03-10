Rails.application.routes.draw do
  resources :user_posts
  resources :todos
  resources :profiles
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resource :homes
  resources :invitations
  resources :messages
  resources :rooms, only: [:show]
  get 'todos/:id/chat' => 'todos#chat', as: :chat
  root 'todos#index'
  post 'invitations/:id/active' => 'invitations#active', as: :complete_invitation
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
