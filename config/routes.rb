Rails.application.routes.draw do

  devise_for :parents, controllers: {
  registrations: "parent/registrations",
  sessions: 'parent/sessions'
  }

  devise_for :employees, controllers: {
  registrations: "employee/registrations",
  sessions: 'employee/sessions'
  }

  scope module: :parent do
    resources :homes, only: [:index]

  end

  namespace :employee do
    resources :homes, only: [:index]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
