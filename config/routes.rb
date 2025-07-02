Rails.application.routes.draw do
  # session routes
  resource :session
  resource :users
  resources :passwords, param: :token

  # admin routes

  resource :admins do
    get "dashboard", to: "admins#index"
    get "leave", to: "admins#leave"
    get "employee", to: "admins#employee"
    get "employee/target", to: "admins#employeetarget"
    get "employee/payroll", to: "admins#payroll"
    get "projects", to: "projects#index"
  end

  get "employee/profile/:id", to: "admins#viewemployee"
  post "leave_aproved", to: "leaves#accept", as: "leave_aproved"
  post "taskcreate", to: "tasks#taskcreate", as: "taskcreate"
  post "salarycreate", to: "salaries#salarycreate", as: "salarycreate"
  patch "salaryupdate", to: "salaries#salaryupdate", as: "salaryupdate"
  post "projectcreate", to: "projects#create", as: "projectcreate"

  # user routes
  resource :profiles
  get "profiles/:id", to: "profiles#show", as: :profile
  patch "profiles/:id", to:  "profiles#update"
  root "pages#index"
  post "apply_leave", to: "leaves#create", as: "leave_submit"
  post "task_manage", to: "tasks#taskmanage", as: "task_manage"
  get "salary", to: "salaries#index"
  patch "/photo", to: "users#update", as: "photo"
end
