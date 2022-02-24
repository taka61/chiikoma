# frozen_string_literal: true

Rails.application.routes.draw do

  get 'tos', to: 'welcome#tos', as: 'tos'
  get 'privacy_policy', to: 'welcome#privacy_policy', as: 'privacy_policy'

  authenticated :user do
    root 'chiikomas#index', as: 'user_authenticated_root'
  end
  root 'welcome#index'

  devise_for :users

  resources :chiikomas do
    collection do
      get 'done'
      resources :achievement, only: %i[index], controller: 'chiikomas/achievement'
    end
  end

  namespace :api, format: 'json' do
    resources :chiikomas do
      collection do
        get :done
      end
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
