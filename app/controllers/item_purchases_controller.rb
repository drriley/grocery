class ItemPurchasesController < ApplicationController
  # user must be logged in to get to inventory info
  before_filter :authenticate_user!

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
      # also filter by current customer
      @items = ItemPurchase.for_customer(current_user.customer_id).for_status(status_number).all
      render 'item_purchases/quick_add_list'
      # once the custom running_low view is done, the controller should
      # render that view instead of the inventory_list one
    
    elsif (location_slugs_list.include?(users_filter_parameter))
      @pagetitle = users_filter_parameter.humanize
      @items = ItemPurchase.for_customer(current_user.customer_id).stored_in(users_filter_parameter).by_status.all
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


#show for item purchase
	
	def show
    @item = ItemPurchase.find(params[:id])
    @store = Store.find(ItemStore.find(@item.item_store_id).store_id)
    @itemname = Item.find(ItemStore.find(@item.item_store_id).item_id)
    def change_status(int)
      @item.update_attribute(:status, int)
      flash[:notice] = "Successfully updated #{@item.item.name} status to #{int}."
    end
  end

  # test url for output: http://localhost:3000/item_purchases/company_intel?company_id=29&start_date='1/9/1990'&end_date='2/3/2013'
  def company_intel
    company_id = params[:company_id]
    start_date = params[:start_date]
    end_date = params[:end_date]

    @intel = ItemPurchase.get_market_share(company_id, start_date, end_date)

    respond_to do |format|
      format.json
    end
  end








end # end controller