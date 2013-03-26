class ShoppingListItem < ActiveRecord::Base
  attr_accessible :item_id, :purchased_yet, :shopping_list_id, :visible_in_list

  # Relationships
  belongs_to :item
  belongs_to :shopping_list
end
