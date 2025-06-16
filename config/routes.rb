Rails.application.routes.draw do
  resources :profiles, only: [ :index, :show, :update ]
  resource :session
  resource :users
  resources :passwords, param: :token
  root "pages#index"
end
