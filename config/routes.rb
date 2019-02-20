Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :user, only: [:index, :create, :update, :destroy]
      resources :list, only: [:index, :create, :update, :destroy]
      resources :book, only: [:index, :create, :destroy]
      resources :response, only: [:index, :create, :update, :destroy]
    end
  end
end
