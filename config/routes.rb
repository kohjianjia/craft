Rails.application.routes.draw do

	resources :crafts do
		collection do
			get :search # creates a new path for searches in craft
		end
	end

	post '/crafts/:id/save_location' => 'crafts#save_location', as: 'save_location'

	resources :sessions, controller: "sessions", only: [:destroy]
	post "/sign_in" => "sessions#create", as: "sign_in_create"
	get "/sign_in" => "sessions#new", as: "sign_in"
	
	get "/faq" => "homepage#faq", as: "faq"

	resources :users, controller: "users", only: [:create, :edit, :update, :show, :index] do
		collection do
			get :search # creates a new path for searches in user
		end
	end

	get "/sign_up" => "users#new", as: "sign_up"

	root 'homepage#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	post "/test" => "homepage#test"
end
