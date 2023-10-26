Rails.application.routes.draw do
  root 'pages#inicio'
  # Main 
  get 'pages/main', to: 'pages#main'
  post 'pages/create_user', to: 'pages#create_user'
  post 'pages/update_hint', to: 'pages#update_hint'
  

end
