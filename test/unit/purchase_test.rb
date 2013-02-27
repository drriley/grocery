require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  should belong_to(:customer)
  # test "the truth" do
  #   assert true
  # end
end
