Rails.application.routes.draw do
  get 'activity_controller/new'

  get 'activity_controller/create'

  get 'activity_controller/update'

  get 'activity_controller/edit'

  get 'activity_controller/destroy'

  get 'activity_controller/index'

  get 'activity_controller/show'

  devise_for :users
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
