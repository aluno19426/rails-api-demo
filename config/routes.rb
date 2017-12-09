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
		end
	end

    post   "api/v2/login"       => "api/v2/sessions#create"
    delete "api/v2/logout"      => "api/v2/sessions#destroy"
	root 'api/v1/authors#index'
end
