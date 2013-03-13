Grocery::Application.routes.draw do
  match 'user/edit' => 'users#edit', :as => :edit_current_user

   # Authentication routes
   match 'user/edit' => 'users#edit', :as => :edit_user
   match 'signup' => 'users#new', :as => :signup
   match 'logout' => 'sessions#destroy', :as => :logout
   match 'login' => 'sessions#new', :as => :login
   resources :sessions
   resources :users

   # Generated model routes
   resources :companies
   resources :customers
   resources :items
   resources :item_stores
   resources :item_purchases
   resources :memberships
   resources :stores
   resources :purchases

   # Semi-static page routes
   match 'home' => 'home#index', :as => :home
   match 'about' => 'home#about', :as => :about
   match 'contact' => 'home#contact', :as => :contact
   match 'privacy' => 'home#privacy', :as => :privacy
   match 'search' => 'home#search', :as => :search

   # Set the root url
   root :to => 'home#index'
end
