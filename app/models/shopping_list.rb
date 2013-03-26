class ShoppingList < ActiveRecord::Base
  attr_accessible :customer_id, :item_id, :purchased_yet, :visible_in_list
end
