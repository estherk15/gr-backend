Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :lists, only: [:index, :show, :create, :update, :destroy]
      resources :books, only: [:index, :create, :update, :destroy]
      resources :responses, only: [:index, :create, :update, :destroy]
      resources :sessions, only: [:new, :create, :destroy]

      post '/login', to: 'users#login'
      patch '/add_book', to: 'lists#add_book'
      patch '/change_list', to: 'lists#change_list'
      get 'users/:id/books', to: 'users#user_books'
    end
  end
end
