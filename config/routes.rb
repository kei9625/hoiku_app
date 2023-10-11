Rails.application.routes.draw do

  devise_for :parents, path: 'parent', controllers: {
  registrations: "parent/registrations",
  sessions: 'parent/sessions'
  }

  devise_for :employees, path: 'employee', controllers: {
  registrations: "employee/registrations",
  sessions: 'employee/sessions'
  }

  namespace :employee do
    resource :mypage, only: [:show, :edit, :update]
    resources :homes, only: [:index]
  end


  scope module: :parent do
    resource :mypages, only: [:show, :edit, :update]
    resources :homes, only: [:index]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
