class ShoppingListItemsController < ApplicationController
	def index
		@shopping_list_items = ShoppingListItems.all
	end
end