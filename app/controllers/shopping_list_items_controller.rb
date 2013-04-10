class ShoppingListItemsController < ApplicationController
	def index
		@shopping_list_items = ShoppingListItem.all
	end
end