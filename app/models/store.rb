class Store < ActiveRecord::Base
  attr_accessible :name, :company_id, :phone, :store_number, :street, :zip
 
  # Relationships
  belongs_to :company
  has_many :item_stores
  
end
