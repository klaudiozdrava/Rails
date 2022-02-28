Rails.application.routes.draw do
  # get 'rooms/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'rooms/index'
  # get "main" ,to:"rooms#index"
  get "home", to:"home#index"

  get "register", to:"register#new"
  post "register", to:"register#create"

  # post "update",to:"main#create"

  delete "logout",to:"home#destroy"
  post "signin",to:"home#create"
  get "sign",to:"home#index"

  get "post",to:"post#index"
  # get "search",to:"main#search"
  post "post",to:"post#create"
  # post "post",to:"post#create"
  post "like",to:"like#create"

  post 'send_invitation',to:"invitations#create"
  post 'accept_invitation',to:"invitations#update"
  post 'reject_invitation',to:"invitations#destroy"

  root "rooms#index"

  resources :rooms do
   resources :messages
 end

  resources :users
  resources :posts
end
