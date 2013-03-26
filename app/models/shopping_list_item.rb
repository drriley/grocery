class ShoppingListItem < ActiveRecord::Base
	attr_accessible :item_id, :purchased_yet, :shopping_list_id, :visible_in_list


	# Relationships

	belongs_to :item
	belongs_to :shopping_list, :dependent => :destroy


	# Validations

	validates_presence_of :item_id, :shopping_list_id


	# Methods

	# get the name of the item by looking at the associated item record
	def name
		self.item.name
	end
	
end
