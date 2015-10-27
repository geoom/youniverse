Rails.application.routes.draw do

	root 'static_pages#home'

	ActiveAdmin.routes(self)

	devise_for :users, controllers: {omniauth_callbacks: "omniauth_sessions"}
	devise_for :admin_users, ActiveAdmin::Devise.config


	get 'home' => 'static_pages#home'

	resources :products, only: [:show]
	resources :users
	resources :requests, only: [:new, :create, :show]
	resources :sitemap, only: [:index]

	resource :cart, only: [:show] do
		put 'add/', to: 'carts#add', as: :add_to
		put 'remove/', to: 'carts#remove', as: :remove_from
		get 'checkout/', to: 'carts#checkout'
	end

	post '/hook' => 'carts#hook'

end
