require 'test_helper'

class ItemPurchaseTest < ActiveSupport::TestCase
  
  should belong_to(:purchase)
  should belong_to(:item_store)
  # not sure if should have_one or if there is a "through" option
  should have_one(:item)
  
  # validation macros
  should validate_presence_of(:quantity)
  should validate_presence_of(:unit)
  should validate_presence_of(:price_per_unit)
  should validate_presence_of(:status)
  
  # validating quantity
  should allow_value("1").for(:quantity)
  should allow_value("1.2").for(:quantity)
  
  should_not allow_value("-1").for(:quantity)
  should_not allow_value("xx").for(:quantity)
  
  # validating unit
  should allow_value("lb").for(:unit)
  should allow_value("lbs").for(:unit)
  should allow_value("oz").for(:unit)
  
  should_not allow_value("zzzz").for(:unit)
  
  #testing methods with context
  
  context "creating 2 instances of item purchases" do
    
    setup do
      @Leonard = FactoryGirl.create(:customer)
      @purchase1 = FactoryGirl.create(:purchase, :customer => @Leonard)
      @purchase2 = FactoryGirl.create(:purchase, :date => 2.days.ago, :customer => @Leonard )
      @item1 = FactoryGirl.create(:item)
      @item2 = FactoryGirl.create(:item, :name => "Kroger Milk", :generic_name => "Milk")
      @store1 = FactoryGirl.create(:store, :company => @company)
      @store2 = FactoryGirl.create(:store, :name => "Giant Eagle - Squirrel Hill", :company => @company, :store_number => 2, :street => "344 Murray Ave")
       @item_store1 = FactoryGirl.create(:item_store, :item => @item1, :store => @store1)
       @item_store2 = FactoryGirl.create(:item_store, :item => @item2, :store => @store2)
      @company = FactoryGirl.create(:company)
      @item_purchase1 = FactoryGirl.create(:item_purchase, :purchase => @purchase1, :item_store => @item_store1, :quantity => 1, :unit => "Gallon", :price_per_unit => "3.99")
      @item_purchase2 = FactoryGirl.create(:item_purchase, :purchase => @purchase2, :item_store => @item_store2)
    end

  teardown do
    @Leonard.destroy 
    @purchase1.destroy
    @purchase2.destroy
    @item1.destroy
    @item2.destroy 
    @store1.destroy 
    @store2.destroy
    @item_store1.destroy 
    @item_store2.destroy
    @company.destroy
    @item_purchase1.destroy 
    @item_purchase2.destroy
  end
  
end # end context
end #end class 
