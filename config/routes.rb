Moodilio::Application.routes.draw do

  post 'sms', to: 'sms#incoming'

  resources :users, only: :index
end
