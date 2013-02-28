class ItemStore < ActiveRecord::Base
  attr_accessible :item_id, :store_id
  belongs_to :item
  belongs_to :store
  has_many :item_purchases

end
