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
  
  
  
end
