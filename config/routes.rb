Rails.application.routes.draw do
  resources :plants
  resources :fish
  root to: 'application#home'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :tanks, only: [:index]
  resources :users, :only => [:show] do
    resources :tanks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
