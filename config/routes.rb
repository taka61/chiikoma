# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :chiikomas do
    resources :achievement, only: %i[index], controller: "chiikomas/achievement"
    collection do
      get 'done'
    end
  end

  namespace :api, format: 'json' do
    resources :chiikomas do
      collection do
        get :done
      end
    end
  end
end
