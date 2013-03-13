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

    # clear any old data in the db
    [ItemStore, Store, Item, ItemPurchase].each(&:delete_all)

    # add some stores
    stores = ['Giant Eagle Squirrel Hill', 'Giant Eagle Market District', 'Giant Eagle East Liberty', 'Giant Eagle Waterfront']
    stores.each do |s|
      store = Store.new
      store.name = s
      store.save!
    end

    # add some items
    items = [
        ['Apples', 2.00, 'lb'],
        ['Steak', 9.00, 'lb'],
        ['Stacey\'s Pita Chips', 3.25, 'package'],
        ['Carr\'s Whole Wheat Crackers', 4.30, 'package'],
        ['Justin\'s Peanut Butter', 4.00, 'package'],
        ['Green Giant Frozen Vegetables', 1.40, 'package'],
        ['Stonyfield Farms Yogurt', 1.00, 'package'],
        ['Salmon', 7.00, 'lb'],
        ['Cuties Clementines', 6.00, 'package'],
        ['Nature\'s Basket Carrots', 2.35, 'package'],
        ['Lays Potato Chips', 2.00, 'package'],
        ['Newman\'s Own Popcorn', 1.50, 'package'],
        ['Pineapple', 3.00, 'unit'],
        ['Red Potatoes', 1.43, 'lb']
    ]
    items.each do |i|
        item = Item.new
        item.name = i[0]
        item.price_per_unit = i[1]
        item.unit = i[2]
        item.save!
    end


    # create some transactions with random times, stores, and customers
    100.times do |i|
        item_store = ItemStore.new
        item_store.time = Time.at(rand * Time.now.to_i)
        item_store.store_id = Store.all.sample.id
        item_store.customer_id = rand(0..234678901)
        item_store.save!
    end

    # create a bunch of transactionItems
    100.times do |i|
        item_purchase = ItemPurchase.new
        item_purchase.item_id = Item.all.sample.id
        item_purchase.transaction_id = ItemStore.all.sample.id
        item_purchase.price_per_unit = rand(1..7)
        item_purchase.quantity = rand(1..30)
        item_purchase.save!
    end

  end
end