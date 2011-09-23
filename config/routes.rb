Imageme::Application.routes.draw do
  devise_for :users
  resources :uploads
  post "/search" => "uploads#search", :as => "search"
  root :to => "main#index"
end
