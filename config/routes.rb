Grocery::Application.routes.draw do

  devise_for :users

<<<<<<< HEAD
	# added here lls
=======
  # added here lls
>>>>>>> devise
  #	root :to => "home#index"	

  # custom routing for competitive intelligence data
  match 'item_purchases/company_intel' => 'item_purchases#company_intel', :defaults=>{:format =>'json'}
  
  resources :item_purchases
<<<<<<< HEAD
  resources :shopping_list_items

  # inventory is homepage
  root :to => 'item_purchases#index'




  # The priority is based upon order of creation:
  # first created -> highest priority.
=======
  
  root :to => 'item_purchases#index'
>>>>>>> devise


end
