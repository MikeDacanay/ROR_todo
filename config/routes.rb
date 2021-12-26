Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, param: :id, only: [:create, :index, :show, :update, :destroy] do
        resources :items, param: :id, only: [:create, :show, :update, :destroy]
      end
    end
  end

  get '*path', to: 'pages#index', via: :all
end
