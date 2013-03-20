class ItemPurchase < ActiveRecord::Base
	attr_accessible :item_store_id, :price_per_unit, :purchase_id, :quantity, :status, :unit

  # Constants
  STORAGE_LOCATIONS_LIST = [['Fridge', 'fridge'],['Freezer', 'freezer'],['Pantry', 'pantry']]
  
	# Relationships
	belongs_to :purchase
	belongs_to :item_store
	has_one :item, :through => :item_store

	# Scopes
	scope :quantityorder, order('quantity')
	
	# Scopes
	scope :alphabetical, order('name')
	scope :chronological, joins(:purchase).order('date')
	# scope to retrieve items based on the passed in location value for their storage location
	scope :stored_in, lambda{|location| where('storage_location = ?', location)}
  # or use a method
	scope :status, lambda { |status| where('status = ?', status) }
  # scope to retrieve all item_purchase under item_id
  scope :for_item, lambda {|item_id| joins(:item_store).where('item_id = ?', item_id)}
  # returns all item_purchases belonging to a specific customer
  scope :for_customer, lambda {|customer_id| joins(:purchase).where('customer_id = ?', customer_id)}
  # returns all items belonging to a specific purchase
  scope :for_purchase, lambda {|purchase_id| where('purchase_id = ?', purchase_id)}


end
