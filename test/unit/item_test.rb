require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should have_many(:item_stores)
  should have_many(:shopping_list_items)
  
  context "growing 2 fruits in items" do
    setup do
      @greenbean = FactoryGirl.create(:item)
      @guava = FactoryGirl.create(:item, :name => "Costco Guava", :generic_name => "Guava", :storage_location => "Fridge", :est_shelf_life => 5)
    end
    
    teardown do
    end
    
    should "have created all the stuff" do
      assert_equal "Costco Guava", @guava.name
    end
    
    should "sort by generic name" do
      assert_equal ["Green Bean", "Guava"], Item.alphabetical_by_generic_name.map{|i| i.generic_name}
    end
  end
end
