Rails.application.routes.draw do
  root to: 'application#home'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, :only => [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
