Rails.application.routes.draw do
	resources :users

	get :search, controller: :dashboard
  root to: 'dashboard#index'

  # apis
  namespace :api do
    namespace :v1 do
      get 'user-trascation-data/:id', to: 'user_data#send_data'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
