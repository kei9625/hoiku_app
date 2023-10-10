Rails.application.routes.draw do
  namespace :employee do
    get 'homes/new'
  end
  devise_for :parents, controllers: {
  registrations: "parent/registrations",
  sessions: 'parent/sessions'
  }

  devise_for :employees, controllers: {
  registrations: "employee/registrations",
  sessions: 'employee/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
