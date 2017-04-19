Rails.application.routes.draw do
  post 'login' => 'login#create'

  resources :users, only: [:create, :index, :show] do
    collection do
      get "me"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
