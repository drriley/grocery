require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should have_many(:purchases)
  should have_many(:memberships)
  
  # validation macros....
  
  should validate_presence_of(:last_name)
  should validate_presence_of(:first_name)
  should validate_presence_of(:email)
  should validate_presence_of(:phone)
  should validate_presence_of(:street)
  should validate_presence_of(:zip)
  
    # Validating email...
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)
  
  # Validating phone...
  should allow_value("4122683259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  
  should_not allow_value("2683259").for(:phone)
  should_not allow_value("4122683259x224").for(:phone)
  should_not allow_value("800-EAT-FOOD").for(:phone)
  should_not allow_value("412/268/3259").for(:phone)
  should_not allow_value("412-2683-259").for(:phone)
  
  # Validating zip...
  should allow_value("03431").for(:zip)
  should allow_value("15217").for(:zip)
  should allow_value("15090").for(:zip)
  
  should_not allow_value("fred").for(:zip)
  should_not allow_value("3431").for(:zip)
  should_not allow_value("15213-9843").for(:zip)
  should_not allow_value("15d32").for(:zip)
  
  context "creating Leonard Sokol" do
    setup do
      @leonard = FactoryGirl.create(:customer)
    end
    
    teardown do
      @leonard.destroy
    end
    
    should "show Leonard's name and proper name" do
      assert_equal "Leonard Sokol", @leonard.proper_name
      assert_equal "Sokol, Leonard", @leonard.name
    end
  end
end
