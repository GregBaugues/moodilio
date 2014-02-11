Moodilio::Application.routes.draw do
  resources :sms, only: [:index]
end
