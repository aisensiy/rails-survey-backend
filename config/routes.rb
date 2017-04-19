Rails.application.routes.draw do
  resources :surveys, only: [:show] do
    resources :results, only: [:create, :destroy, :index]
  end

  post 'login' => 'login#create'

  resources :users, only: [:create, :index, :show] do
    collection do
      get "me"
    end
    resources :surveys, only: [:index, :create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
