class Purchase < ActiveRecord::Base
	attr_accessible :customer_id, :date

	# Relationships
	belongs_to :customer
	has_many :item_purchases
end
