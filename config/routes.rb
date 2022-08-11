Rails.application.routes.draw do
  root :to => 'pages#home'
  
  resources :seats
  resources :flights
  resources :airplanes
  resources :reservations
  resources :users

   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome' 
end
