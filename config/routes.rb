Rails.application.routes.draw do
  # session routes
  resource :session
  resource :users
  resources :passwords, param: :token

  # admin routes
  resource :admins
  get "admins/dashboard", to: "admins#index"
  get "admins/leave", to: "admins#leave"
  get "admins/leave", to: "admins#leave"
  get "admins/employee", to: "admins#employee"
  post "leave_aproved", to: "leaves#accept", as: "leave_aproved"
  get "employee/profile/:id", to: "admins#viewemployee"
  # user routes
  resource :profiles
  get "profiles/:id", to: "profiles#show", as: :profile
  patch "profiles/:id", to:  "profiles#update"
  root "pages#index"
  post "apply_leave", to: "leaves#create", as: "leave_submit"
end
