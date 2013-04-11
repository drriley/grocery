Grocery::Application.routes.draw do

  devise_for :users

  # custom routing for competitive intelligence data
  match 'item_purchases/company_intel' => 'item_purchases#company_intel', :defaults=>{:format =>'json'}
  
  resources :item_purchases
  resources :shopping_list_items

  # inventory is homepage
  root :to => 'item_purchases#index'

end
