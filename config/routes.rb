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
  post "taskcreate", to: "tasks#taskcreate", as: "taskcreate"
  get "admins/employee/target", to: "admins#employeetarget"
  get "admins/employee/payroll", to: "admins#payroll"
  post "salarycreate", to: "salaries#salarycreate", as: "salarycreate"
  # user routes
  resource :profiles
  get "profiles/:id", to: "profiles#show", as: :profile
  patch "profiles/:id", to:  "profiles#update"
  root "pages#index"
  post "apply_leave", to: "leaves#create", as: "leave_submit"
  post "task_manage", to: "tasks#taskmanage", as: "task_manage"
end
