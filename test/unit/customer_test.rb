require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should have_many(:purchases)
  # test "the truth" do
  #   assert true
  # end
end
