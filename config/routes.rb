# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'
  # get 'users/show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'signup', to: 'users#create'
  get 'signup', to: 'users#new'

  root 'welcome#home'
  resources :articles
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
