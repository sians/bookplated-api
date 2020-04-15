Rails.application.routes.draw do

  namespace :api, as: nil do
    devise_for :users, skip: :all
    devise_scope :user do
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
      post 'reset_password', to: 'passwords#reset'
      patch 'password', to: 'passwords#update'
    end

    resources :users_books, only: [:index, :show, :create, :update]
    resources :users_authors, onlu: [:index, :show, :create, :update]
  end

end
