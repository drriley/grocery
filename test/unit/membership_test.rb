require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:customer)
  should belong_to(:company)
end
