Grocery::Application.routes.draw do

  devise_for :users

  # custom routing for competitive intelligence data
  match 'item_purchases/company_intel' => 'item_purchases#company_intel', :defaults=>{:format =>'json'}
  match 'item_purchases/user_spending' => 'item_purchases#user_spending' 
  resources :item_purchases
  resources :shopping_list_items

  resources :customers # just for development

  # inventory is homepage
  root :to => 'item_purchases#index'
end
