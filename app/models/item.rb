class Item < ActiveRecord::Base
	attr_accessible :est_shelf_life, :generic_name, :name
	
	# Relationships
	has_many :stores

	# Scopes
	scope :alphabetical, order('name')
 
end
