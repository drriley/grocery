class Store < ActiveRecord::Base
  attr_accessible :company_id, :phone, :store_number, :street, :zip
  belongs_to :company
  has_many :item_stores
  
  
  
end
