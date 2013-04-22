class ShoppingListItemsController < ApplicationController
  # user must be logged in to get to inventory info
  before_filter :authenticate_user!
	
  def index
	  @shopping_list_items = ShoppingListItem.all
  end

  def new
    if params[:from].nil?
      if params[:id].nil?
        @shopping_list_item = ShoppingListItem.new
      else
        @shopping_list_item = ShoppingListItem.find(params[:id])
      end
    else
      @shopping_list_item = ShoppingListItem.new
      if params[:from] == "almost_out" 
        @shopping_list_item.customer_id = params[:customer_id]
        @shopping_list_item.item_id = params[:item_id]
      end
    end
  end






  def edit
    @shopping_list_item = ShoppingListItem.find(params[:id])
  end

  def create
    @shopping_list_item = ShoppingListItem.new(params[:shopping_list_item])
    if @shopping_list_item.save
      # if saved to database
      flash[:notice] = "Successfully created #{@shopping_list_item.item.name}."
      redirect_to @shopping_list_item # go to show shopping_list_item page
    else
      # return to the 'new' form
      render :action => 'new'
    end
  end

  def update
    @shopping_list_item = ShoppingListItem.find(params[:id])
    authorize! :update, @shopping_list_item
    if @shopping_list_item.update_attributes(params[:shopping_list_item])
      flash[:notice] = "Successfully updated #{@shopping_list_item.item.name}."
      redirect_to @shopping_list_item
    else
      render :action => 'edit'
    end
  end

  def destroy
    @shopping_list_item = ShoppingListItem.find(params[:id])
    @shopping_list_item.destroy
    flash[:notice] = "Successfully removed #{@shopping_list_item.item.name} from your list."
    redirect_to shopping_list_items_url
  end
end