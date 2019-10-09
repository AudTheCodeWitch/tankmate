Rails.application.routes.draw do
  devise_for :users, :controlleers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
