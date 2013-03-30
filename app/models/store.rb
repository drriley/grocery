class Store < ActiveRecord::Base
  attr_accessible :name, :company_id, :phone, :store_number, :street, :zip
 
  # Relationships
  belongs_to :company
  has_many :item_stores
  
  # if zip included, it must be 5 digits only
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long", :allow_blank => true
  # phone can have dashes, spaces, dots and parens, but must be 10 digits
  validates_format_of :phone, :with => /^(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})$/, :message => "should be 10 digits (area code needed) and delimited with dashes only"
end
