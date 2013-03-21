class ItemPurchasesController < ApplicationController

	def index
    # list of possible location options that a user could pass in
    # based on the constants defined in the model
    location_slugs_list = Item::STORAGE_LOCATIONS_LIST.map{|location_nameset| location_nameset[1]}
    status_options_list = ItemPurchase::STATUSES.values
    users_filter_parameter = params[:f]
    
    # if the user passed in a valid location, render the inventory list for that location
  
    # also allow the user to pass in statuses
    if (status_options_list.include?(users_filter_parameter))
      status_number = ItemPurchase::STATUSES.key(users_filter_parameter)
      @items = ItemPurchase.for_status(status_number).all
      render 'item_purchases/quick_add_list'
      # once the custom running_low view is done, the controller should
      # render that view instead of the inventory_list one
    
    elsif (location_slugs_list.include?(users_filter_parameter))
      @pagetitle = users_filter_parameter.humanize
      @items = ItemPurchase.stored_in(users_filter_parameter).by_status.all
      render 'item_purchases/inventory_list'

    # otherwise if there's no parameter or the parameter is invalid, just render links to the item sections
    else
  		@item_sections = Item::STORAGE_LOCATIONS_LIST
  		# also add in our non-location filter, the running low one, if we haven't added it yet
  		if (@item_sections.length == Item::STORAGE_LOCATIONS_LIST.length && @item_sections.length < 4) 
  			@item_sections << ['Almost Out', 'almost_out']
  		end
      render 'item_purchases/inventory_locations_list'
    end

	end # end index

  def company_intell
    company_parameter = params[:company_id]
    start_date = params[:start_date]
    end_date = params[:end_date]

    

    @intell = ItemPurchase.items_not_at_store(company_parameter)



    respond_to do |format|
      format.json { render json: @intell }
    end
  end


end # end controller