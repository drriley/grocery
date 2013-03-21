namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke
    
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    require 'faker'

    # clear any old data in the db
    [Company, Store, Item, ItemPurchase, ItemStore, Membership, Customer, Purchase].each(&:delete_all)

    # create a few companies. company's only attribute is name.
    companies = ['Giant Eagle', "Trader Joe's", 'Whole Foods', 'IGN']
    companies.each do |c|
        # create a new instance of the company model
        company = Company.new
        # add one of the names from the above array to it
        company.name = c
        # save it to the database
        company.save!
    end

    # add some stores. 
    # stores' attributes: :name, :company_id, :phone, :store_number, :street, :zip
    stores = ['Giant Eagle Squirrel Hill', 'Giant Eagle Market District', 'Giant Eagle East Liberty', 'Giant Eagle Waterfront']
    stores.each do |s|
      store = Store.new
      store.name = s
      store.store_number = rand()*1000000
      store.phone = rand(10 ** 10).to_s.rjust(10,'0')
      store.street = Faker::Address.street_address
      store.zip = Faker::Address.zip_code[0,5]
      # create association with company
      store.company_id = Company.all.sample.id
      store.save!
    end

    # add some customers 
    # customers' attributes: :email, :first_name, :last_name, :phone, :street, :zip
    30.times {
        # new instance of customer
        customer = Customer.new
        # lotsa fake data
        customer.email = Faker::Internet.email
        customer.first_name = Faker::Name.first_name
        customer.last_name = Faker::Name.last_name
        customer.phone = rand(10 ** 10).to_s.rjust(10,'0')
        customer.street = Faker::Address.street_address
        customer.zip = Faker::Address.zip_code[0,5]
        # save to the database
        customer.save!
    }

    # give our customers some memberships
    # memberships' attrs are: :company_id, :customer_id, :loyalty_id
    Customer.all.each do |c|
        # create between two and four memberships for each customer
        num_memberships = rand(2..4)
        num_memberships.times {
            membership = Membership.new
            membership.company_id = Company.all.sample.id
            membership.customer_id = c.id
            membership.loyalty_id = rand(1000000..9000000)
            membership.save!
        }
    end

    # add some items
    # items' attrs: :est_shelf_life, :generic_name, :name, :storage_location
    items = ['apples', 'steak', 'pita chips', 'potatoes', 'whole wheat crackers', 'peanut butter', 'canned peas', 'frozen mixed vegetables', 'yogurt', 'wheat flakes cereal', 'clementines', 'canned tuna', 'salmon', 'clementines', 'pineapple', 'popcorn', 'potato chips', 'red potatoes', 'macaroni and cheese', 'linguine pasta', 'rigatoni pasta', 'marinara sauce', 'white rice']
    items.each do |i|
        item = Item.new
        item.generic_name = i
        item.name = Faker::Company.name + ' ' + i
        # because shelf life is totally random...
        item.est_shelf_life = rand(7..300)
        # randomly select a storage area. why not put canned peas in the fridge?
        # sampling the storage locations list will return a two item array with the human-readable
        # and machine friendly versions of the storage location's name. we want the second item in the array (index = 1)
        item.storage_location = Item::STORAGE_LOCATIONS_LIST.sample[1]
        item.save!
    end


    # create item_stores (basically item stock records)
    # item_store attrs: :item_id, :store_id
    10.times {
        item_store = ItemStore.new
        item_store.item_id = Item.all.sample.id
        item_store.store_id = Store.all.sample.id
        item_store.save!
    }


    # create some purchases
    # purchases' attrs: :customer_id, :date
    50.times {
        purchase = Purchase.new
        purchase.customer_id = Customer.all.sample.id # one of our customer records, picked at random
        purchase.date = Time.at(rand * Time.now.to_i) # some random date
        purchase.save!
    }

    # create item_purchases
    # item_purchases' attrs: :_id, :item_store_id, :price_per_unit, :purchase_id, :quantity, :status, :unit
    70.times {
        item_purchase = ItemPurchase.new
        item_purchase.item_store_id = ItemStore.all.sample.id
        item_purchase.price_per_unit = rand(1..7)
        item_purchase.purchase_id = Purchase.all.sample.id
        item_purchase.quantity = rand(1..19)
        item_purchase.unit = ['lb', 'bag', 'box', 'oz'].sample
        item_purchase.status = ItemPurchase::STATUSES.keys.sample
        item_purchase.save!
    }

  end
end