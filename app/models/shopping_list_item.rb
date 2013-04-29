class ShoppingListItem < ActiveRecord::Base
	attr_accessible :item_id, :purchased_yet, :customer_id, :visible_in_list, :location, :item

	# Relationships
	belongs_to :item
	belongs_to :customer


	# Scopes
	scope :for_customer, lambda{|customer_id| where('customer_id = ?', customer_id)}
	scope :alphabetical_by_name, joins(:item).order('name')
	scope :alphabetical_by_generic_name, joins(:item).order('generic_name')
	

	# Validations
	validates_presence_of :item_id, :customer_id


	# Methods

	# get the name of the item by looking at the associated item record
	def name
		self.item.name
	end
	
end
