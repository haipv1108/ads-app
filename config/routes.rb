Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'
  get 'contact' => 'static_pages#contact'
  get 'service' => 'static_pages#service'
  get 'about' => 'static_pages#about'

  resources :articles
  resources :types
  resources :careers
  resources :purposes
end
