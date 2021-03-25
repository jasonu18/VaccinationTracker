Rails.application.routes.draw do
  root :to => "books#index"
   get 'books/index'
   get 'books/show'
   get 'books/new'
   get 'books/edit'
   get 'books/delete'

  #
  resources :book do
    member do
      get :delete
      get :show
      post :create
      post :edit
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
