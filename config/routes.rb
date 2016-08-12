Rails.application.routes.draw do
  root 'static_pages#home'

  get '/shared_stats/:token' => 'activities#stats', as: 'share_stats'

  devise_for :users
  resources :activities do
    collection do
      get 'stats'
      get 'share_stats'
      post 'send_token'
    end
  end

end
