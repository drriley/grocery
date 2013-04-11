Grocery::Application.routes.draw do

  match 'item_purchases/company_intel' => 'item_purchases#company_intel', :defaults=>{:format =>'json'}
  resources :item_purchases
  root :to => 'item_purchases#index'
  
end
