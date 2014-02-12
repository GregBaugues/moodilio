Moodilio::Application.routes.draw do
  post 'sms', to: 'sms#incoming'
end
