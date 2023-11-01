Rails.application.routes.draw do
  devise_for :parents, path: 'parent', controllers: {
  registrations: "parent/registrations",
  sessions: 'parent/sessions'
  }

  devise_for :employees, path: 'employee', controllers: {
  registrations: "employee/registrations",
  sessions: 'employee/sessions'
  }

  devise_scope :parent do
    get "/" => "parent/sessions#new"
  end

  namespace :employee do
    resource :mypage, only: [:show, :edit, :update]
    resources :homes, only: [:index]
    resources :parents, only: [:index, :show, :edit, :update]
    resources :kids

    resources :notes do
      collection do
        get 'parent/:parent_id', to: 'notes#show_parent_notes', as: 'parent_notes'
      end
    end
  end

  scope module: :parent do
    resource :mypage, only: [:show, :edit, :update]
    resources :homes, only: [:index]

    resources :notes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :parents do
      resources :kids
      post 'attendance_create', to: 'attendances#create', as: 'attandance_create'
      patch 'attendance_update', to: 'attendances#update', as: 'attandance_update'
      resources :attendances, only: [:index, :show, :edit, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
