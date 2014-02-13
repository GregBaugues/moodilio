Moodilio::Application.routes.draw do

  root to: 'users#index'
  post 'sms', to: 'sms#incoming'
  get  'call', to: 'call#outgoing'
  get 'connect', to: 'call#connect'
  post 'connect', to: 'call#connect'

  resources :users, only: :index
end
