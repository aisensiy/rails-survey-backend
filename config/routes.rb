Rails.application.routes.draw do
  resources :surveys, only: [:show, :update] do
    resources :results, only: [:create, :destroy, :index]
  end

  post 'login' => 'login#create'

  resources :users, only: [:create, :index, :show] do
    collection do
      get "me"
    end
    resources :surveys, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
