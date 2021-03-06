require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  
  # relationship macros
  should belong_to(:customer)
  should belong_to(:company)
  
  # validation macros
  should validate_presence_of(:company)
  should validate_presence_of(:customer)
  
  # validating loyalty card
  should allow_value("GEAC5782748293").for(:loyalty_id)
  should allow_value("348983491Ghdaf").for(:loyalty_id)
  should allow_value("9324dcjjdjdjds").for(:loyalty_id)
  
  
end
