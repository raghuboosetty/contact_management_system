Rails.application.routes.draw do
  devise_for :employees

  resources :groups do
    resources :contacts
  end
  resources :contacts, only: :[] do
    collection do
      get :all
    end
  end
  resource :employee, only: :show

  root 'groups#index'
end
