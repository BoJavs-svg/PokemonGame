Rails.application.routes.draw do
  root 'pages#inicio'
  
  # No route matches [POST] "/pages/create_user"
  post 'pages/create_user', to: 'pages#create_user'
  



end
