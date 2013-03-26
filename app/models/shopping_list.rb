class ShoppingList < ActiveRecord::Base
  attr_accessible :customer_id

  # Relationships
  belongs_to :customer
  has_many :shopping_list_items
  has_many :items, :through => :shopping_list_items

  # Validations
  validates_presence_of :customer_id
  
end
