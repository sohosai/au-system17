Rails.application.routes.draw do
  resources :reception_desks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'

end
