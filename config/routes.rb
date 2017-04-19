Rails.application.routes.draw do
  resources :surveys, only: [:show]
  post 'login' => 'login#create'

  resources :users, only: [:create, :index, :show] do
    collection do
      get "me"
    end
    resources :surveys, only: [:index, :create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
