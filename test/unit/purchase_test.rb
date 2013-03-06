require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  should belong_to(:customer)
  # test "the truth" do
  #   assert true
  # end
  
  should validate_presence_of(:date)
  
  should allow_value("01-01-2013").for(:date)
end
