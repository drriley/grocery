Grocery::Application.routes.draw do

  devise_for :users

  # added here lls
  #	root :to => "home#index"	

  match 'item_purchases/company_intel' => 'item_purchases#company_intel', :defaults=>{:format =>'json'}
  
  resources :item_purchases
  
  root :to => 'item_purchases#index'


end
