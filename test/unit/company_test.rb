require 'test_helper'
class CompanyTest < ActiveSupport::TestCase
  should allow_value("anything").for(:name)
  
  context "creating one instance of a company" do
    setup do
      @geagle = FactoryGirl.create(:company)
      @ralphs = FactoryGirl.create(:company, :name => "Ralphs")
    end
    
    teardown do
      # @gealge.destroy
      # @ralphs.destroy
    end
    
    should "create 2 companies in setup" do
      assert_equal "Giant Eagle Co.", @geagle.name
      assert_equal "Ralphs", @ralphs.name
    end
  end
end


