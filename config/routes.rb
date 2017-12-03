Rails.application.routes.draw do
	resources :authors do
		resources :articles do
			resources :comments
		end
	end

	root 'authors#index'
end
