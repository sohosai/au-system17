Rails.application.routes.draw do
  get "/found_items/search", to: "found_items#search"
  post "/found_items/search", to: "found_items#search"
  get "/lost_items/search", to: "lost_items#search"
  post "/lost_items/search", to: "lost_items#search"
  resources :lost_items
  resources :found_items
  resources :reception_desks
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  root "pages#index"
end
