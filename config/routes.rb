Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, param: :id, only: [:create, :index, :show, :update, :delete]
      resources :items, param: :id, only: [:create, :index, :show, :update, :delete]
    end
  end

  get '*path', to: 'pages#index', via: :all
end
