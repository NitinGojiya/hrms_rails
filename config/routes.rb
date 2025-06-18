Rails.application.routes.draw do
  resource :profiles
  resource :admins
  get "admins/dashboard", to: "admins#index"
  get "profiles/:id", to: "profiles#show", as: :profile
  patch "profiles/:id", to:  "profiles#update"
  resource :session
  resource :users
  resources :passwords, param: :token
  root "pages#index"
  post "apply_leave", to: "leaves#create", as: "leave_submit"
end
