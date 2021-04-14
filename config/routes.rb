Rails.application.routes.draw do
  root :to => "patients#index"
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  # get 'books/delete'
  #
  get 'patients/index'
  get 'patients/show'
  get 'patients/new'
  get 'patients/edit'
  get 'patients/delete'

  #
  resources :books do
    member do
      get :delete
    end
  end

  resources :patients do
    member do
      get :delete
      get :show
      post :create
      post :edit
      get :qr_code
      get :vacc_rec
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
