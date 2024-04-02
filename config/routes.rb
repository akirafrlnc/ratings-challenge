Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb

	# only use products/show for one page application
  resources :products, only: [:show] do
		# route for submmiting a review from show page
    resources :reviews, only: [:create]
  end
end
