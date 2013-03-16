class ItemsController < ApplicationController

	# On the index view for items, we want to display all of the items in the current user's inventory.
	# Sort of. We aren't really displaying all of the items in the inventory. Instead, we're displaying links to subsections of the person's inventory, such as kitchen areas and a 'running low' section
	def index
		@item_sections = Item::STORAGE_LOCATIONS_LIST
		# also add in our non-location filter, the running low one
		@item_sections << ['Running Low', 'running_low']
	end
  

  	def fridge
  		@items = Item.stored_in('fridge').all
  	end


  	def freezer
  		@items = Item.stored_in('freezer').all
  	end


  	def pantry
  		@items = Item.stored_in('pantry').all
  	end


  	def running_low
  		@items = Item.running_low.all
  	end

end