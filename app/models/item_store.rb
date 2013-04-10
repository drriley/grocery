class ItemStore < ActiveRecord::Base
	attr_accessible :item_id, :store_id

	# Relationships
	belongs_to :item
	belongs_to :store
	has_many :item_purchases
	
	validates_presence_of :item_id, :on => :create, :message => "can't be blank"
	validates_presence_of :store_id, :on => :create, :message => "can't be blank"
end
