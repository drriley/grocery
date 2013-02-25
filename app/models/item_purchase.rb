class ItemPurchase < ActiveRecord::Base
  attr_accessible :_id, :item_store_id, :price_per_unit, :purchase, :quantity, :status, :unit
end
