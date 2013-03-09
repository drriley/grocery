class ItemPurchase < ActiveRecord::Base
	attr_accessible :_id, :item_store_id, :price_per_unit, :purchase_id, :quantity, :status, :unit

	# Relationships
	belongs_to :purchase
	belongs_to :item_store

	# Scopes
	scope :quantityorder, order('quantity')

end
