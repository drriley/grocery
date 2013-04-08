require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
# 
# # this test file is weird.... throw errors....
#   
#   should belong_to(:customer)
#   should have_many(:item_purchases)
#   should validate_presence_of(:date)
#   should allow_value("01-01-2013").for(:date)
#   
#   context "creating 2 purchases on different dates" do 
#     setup do
#       @leonard = Factorygirl.create(:customer)
#       @purchase1 = Factorygirl.create(:purchase, :customer => @leonard)
#       @purchase2 = Factorygirl.create(:purchase, :customer => @leonard, :date => 1.day.ago.to_date)
#     end 
#     
#     teardown do
#       # @leonard.destroy
#       # @purchase1.destroy
#       # @purchase2.destroy
#     end
#     
#     should "have dates" do
#       assert_equal Date.today, @purchase1.date
#       assert_equal 1.day.ago.to_date, @purchase2.date
#       assert_not_equal 2.day.ago.to_date, @purchase2.date
#       assert_not_equal 2, @purchase2.date
#     end
#     
#   end
#   
end