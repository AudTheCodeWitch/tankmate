Rails.application.routes.draw do
  root to: 'tanks#index'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :tanks, only: [] do
    resources :fish, only: [:new, :create, :update, :destroy, :edit]
    resources :plants, only: [:new, :create, :update, :destroy, :edit]
  end
  resources :users, only: [:show] do
    resources :tanks, only: [:new, :create, :show, :update, :destroy, :edit]
    resources :maintenances, only: [:new, :index, :create, :update, :destroy, :edit]
    resources :tasks, only: [:index, :edit, :update, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
