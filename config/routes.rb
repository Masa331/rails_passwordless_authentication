Rails.application.routes.draw do
  post 'logins/create'
  get 'sessions/create'
  delete 'sessions/destroy'

  resources :users

  root 'users#index'
end
