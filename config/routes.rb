Rails.application.routes.draw do

	root 'static_pages#home'

	ActiveAdmin.routes(self)

	devise_for :users, controllers: { omniauth_callbacks: "omniauth_sessions" }
	devise_for :admin_users, ActiveAdmin::Devise.config


	get 'home' => 'static_pages#home'

	resources :products
	resources :users
	resources :sitemap, only: [:index]

end
