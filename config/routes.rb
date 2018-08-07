Rails.application.routes.draw do

  get 'crafts/index'
  # get 'sessions/new'
  resources :sessions, controller: "sessions", only: [:create, :destroy]
  get "/sign_in" => "sessions#new", as: "sign_in"

  get "/homepage" => "homepage#index"

  resources :users, controller: "users", only: [:create, :edit, :update, :show, :index]

  get "/sign_up" => "users#new", as: "sign_up"

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
