Rails.application.routes.draw do
  resources :contacts
  resources :groups
  devise_for :employees
  
  root 'groups#index'
end
