Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do
			resources :authors do
				resources :articles do
					resources :comments
				end
			end
		end
	end

	namespace :api do
		namespace :v2 do
			resources :authors do
				resources :articles
			end
			resource :authentication, only: %i[create]
			#post 'authentication', to: 'authentication#create', as: "auth"
		end
	end

	root 'api/v1/authors#index'
end
