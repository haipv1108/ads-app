Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'contact' => 'home#contact'
  get 'service' => 'home#service'
  get 'about' => 'home#about'

  resources :articles, only: [:new, :create, :show]
  get 'articles/preview/:id' => 'articles#preview', as: 'preview_article'
  get 'search_articles', to:  'articles#search'

  namespace :admin do
    root to: 'dashboards#index'
    resources :types, except: [:show]
    resources :careers, except: [:show]
    resources :purposes, except: [:show]
  end

  resources :admin, only: [:index, :destroy]
  get 'admin/approve/:id' => 'admin#approve', as: 'approve_article_admin'

end
