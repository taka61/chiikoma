# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :chiikomas do
    resources :status, only: %i[create], controller: 'chiikomas/status'
    collection do
      get 'done'
    end
  end
end
