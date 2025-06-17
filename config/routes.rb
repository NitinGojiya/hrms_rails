Rails.application.routes.draw do
  resources :profiles, only: [ :index, :show, :update, :new, :create ]
  resource :session
  resource :users
  resources :passwords, param: :token
  root "pages#index"
  post "apply_leave", to: "leaves#create", as: "leave_submit"
end
