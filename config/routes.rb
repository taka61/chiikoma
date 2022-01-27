# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :chiikomas do
    resources :status, only: %i[create], controller: 'chiikomas/status'
    collection do
      get 'done'
    end
  end
  namespace :api do
    resources :chiikomas, only: %i[index]
  end
end
