Rails.application.routes.draw do
  resources :contacts
  resources :groups
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
