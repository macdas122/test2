Rails.application.routes.draw do
  devise_for :skcs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
  resources :mains, only: [ :index, :show]
  resources :subgroup, only: [ :index, :show, :create]
  resources :studies, only: [ :index, :create]
  resources :main, only: [ :index, :create]
  resources :dashboard, only: [ :index]
  resources :gbasubgroup, only: [ :index , :create]
  resources :study_arms, only: [ :index, :create]
end
