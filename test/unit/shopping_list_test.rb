require 'test_helper'

class ShoppingListTest < ActiveSupport::TestCase
  should validate_presence_of(:customer_id)
end
