require 'test_helper'

class ItemStoreTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:store)
  should have_many(:item_purchases)

  should validate_presence_of(:item_id)
  should validate_presence_of(:store_id)
        
end
