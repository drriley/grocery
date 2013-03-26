FactoryGirl.define do

  factory :item_purchase do
    association :purchase
    association :item_store
    quantity 10
    unit "box"
    price_per_unit 1.99
    status "just_bought_it"
    override_storage_location "Fridge"
  end
  
  factory :purchase do
    association :customer
    date Date.today
  end
  
  factory :item_store do
    association :item
    association :store
  end

  factory :customer do
    last_name "Sokol"
    first_name "Leonard"
    email "example@grocery.com"
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    street "5000 Forbes Ave."
    zip "15213"
  end

  factory :company do
    name "Giant Eagle Co."
  end

  factory :item do
    name "Kroger Green Bean"
    generic_name "Green Bean"
    storage_location "Fridge"
    est_shelf_life 10
  end
  
  factory :membership do
    association :customer
    association :company
    loyalty_id { rand(10 ** 10).to_s.rjust(10,'0') }
  end
  
  factory :store do
    name "Giant Eagle - Shadyside"
    association :company
    store_number 1
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    street "5000 Centre Ave."
    zip "15232"
  end

end