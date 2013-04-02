class ShoppingListItem < ActiveRecord::Base
	attr_accessible :item_id, :purchased_yet, :customer_id, :visible_in_list


	# Relationships

	belongs_to :item
	belongs_to :customer


	# Validations

	validates_presence_of :item_id, :customer_id


	# Methods

	# get the name of the item by looking at the associated item record
	def name
		self.item.name
	end
	
end
