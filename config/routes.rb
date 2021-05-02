Rails.application.routes.draw do
  root :to => "patients#home"
  get 'patients/index'
  get 'patients/show'
  get 'patients/new'
  get 'patients/edit'
  get 'patients/delete'
  get 'patients/home'

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
