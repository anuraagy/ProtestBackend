Rails.application.routes.draw do
  devise_for :users

  resources :movements do
    get :search, :on => :collection, :as => :search
    get :build,  :on => :collection, :as => :build
  end

  resources :posts do
    get :search, :on => :collection, :as => :search
    get :build,  :on => :collection, :as => :build
  end

  resources :comments  do
    get :search, :on => :collection, :as => :search
    get :build,  :on => :collection, :as => :build
  end

end
