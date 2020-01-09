Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root'users#new'
  # ⬇︎URL変更の仕方
  get'home/about',to:'books#new',as:'home_about'
  resources :books
  resources :users
  
  # resources :books, only: [:new, :create, :index, :show, :destroy, :update,:edit]
  # resources :users, only: [:new, :create, :index, :show, :edit, :update]
end
