Rails.application.routes.draw do

	resources :crafts do
		collection do
			get :search # creates a new path for searches
		end
	end

	post '/crafts/:id/save_location' => 'crafts#save_location', as: 'save_location'

	resources :sessions, controller: "sessions", only: [:create, :destroy]
	get "/sign_in" => "sessions#new", as: "sign_in"
	
	get "/faq" => "homepage#faq", as: "faq"

	resources :users, controller: "users", only: [:create, :edit, :update, :show, :index] 

	get "/sign_up" => "users#new", as: "sign_up"

	root 'homepage#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
