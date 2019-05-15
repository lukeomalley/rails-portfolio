# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects, except: [:show]
  get 'portfolio/:id', to: 'projects#show', as: 'project_show'

  get 'about', to: 'pages#about'
  get 'angular-items', to: 'projects#angular'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
