Rails.application.routes.draw do

  namespace :employee do
    get 'kids/new'
    get 'kids/edit'
  end
  namespace :parent do
    get 'kids/new'
    get 'kids/edit'
  end
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
    resources :parents, only: [:index, :show, :edit, :update]
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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
