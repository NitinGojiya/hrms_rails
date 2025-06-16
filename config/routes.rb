Rails.application.routes.draw do
  resource :session
  resource :users
  resources :passwords, param: :token
  root "pages#index"
end
