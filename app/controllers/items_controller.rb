class ItemsController < ApplicationController

	def index
    # list of possible location options that a user could pass in
    # based on the constants defined in the model
    location_slugs_list = Item::STORAGE_LOCATIONS_LIST.map{|location_nameset| location_nameset[1]}
    users_filter_parameter = params[:f]
    
    # if the user passed in a valid location, render the inventory list for that location
    if (users_filter_parameter.nil? == false)
      @pagetitle = users_filter_parameter.humanize
      if (location_slugs_list.include?(users_filter_parameter))
        @items = Item.stored_in(users_filter_parameter).all
        render 'items/inventory_list'

      # also allow the user to pass in the 'running low' parameter, to render the running low inventory list
      elsif (users_filter_parameter == 'running_low')
        @items = Item.running_low.all
        render 'items/inventory_list'
        # once the custom running_low view is done, the controller should
        # render that view instead of the inventory_list one
      end

    # otherwise if there's no parameter or the parameter is invalid, just render links to the item sections
    else
  		@item_sections = Item::STORAGE_LOCATIONS_LIST
  		# also add in our non-location filter, the running low one, if we haven't added it yet
  		if (@item_sections.length == Item::STORAGE_LOCATIONS_LIST.length && @item_sections.length < 4) 
  			@item_sections << ['Running Low', 'running_low']
  		end
      render 'items/inventory_locations_list'
    end

	end # end index

end # end controller