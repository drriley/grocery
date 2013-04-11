class ShoppingListItemsController < ApplicationController
	# user must be logged in to get to inventory info
 	before_filter :check_login
 	authorize_resource
	def index
		@shopping_list_items = ShoppingListItems.all
	end
end