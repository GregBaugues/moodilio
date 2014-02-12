Moodilio::Application.routes.draw do

  root to: 'users#index'
  post 'sms', to: 'sms#incoming'

  resources :users, only: :index
end
