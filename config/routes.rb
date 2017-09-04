Rails.application.routes.draw do
  resources :lost_items
  resources :found_items
  resources :reception_desks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'

end
