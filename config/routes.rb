Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  resources :activities do
    collection do
      get 'stats'
    end
  end

end
