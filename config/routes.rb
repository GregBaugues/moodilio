Moodilio::Application.routes.draw do
  root 'welcome#index'

  get '/sms', to: 'sms#incoming'

end
