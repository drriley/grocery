class Purchase < ActiveRecord::Base
  attr_accessible :customer_id, :date
  belongs_to :customer
  has_many :item_purchases
  
  
end
