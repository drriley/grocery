require 'test_helper'

class ShoppingListItemTest < ActiveSupport::TestCase
  should validate_presence_of(:shopping_list_id)
  should validate_presence_of(:item_id)
end
