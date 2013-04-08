class Item < ActiveRecord::Base
	attr_accessible :est_shelf_life, :generic_name, :name, :storage_location
	
	# Constants
  	STORAGE_LOCATIONS_LIST = [['Fridge', 'fridge'],['Freezer', 'freezer'],['Pantry', 'pantry']]


	# Relationships
	has_many :item_stores
	has_many :shopping_list_items


	# Scopes

	scope :alphabetical_by_name, order('name')
	scope :alphabetical_by_generic_name, order('generic_name')
	# scope to retrieve items based on the passed in location value for their storage location
	scope :stored_in, lambda{|location| where('storage_location = ?', location)}
 
end
