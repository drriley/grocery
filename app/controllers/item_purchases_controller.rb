class Item_purchasesController < ApplicationController

  def index
    @item_purchases = Item_purchase.all
  end

  def show
     # get data on that particular animal
      @item_purchase = Item_purchase.find(params[:id])    
  end

  def new
    @item_purchase = Item_purchase.new
  end

  def edit
    @item_purchase = Item_purchase.find(params[:id])
  end

  def create
    @item_purchase = Item_purchase.new(params[:item_purchase])
    if @item_purchase.save
      flash[:notice] = "Successfully created Item_purchase."
      redirect_to @item_purchase
    else
      render :action => 'new'
    end
  end

  def update
    @item_purchase = Item_purchase.find(params[:id])
    if @item_purchase.update_attributes(params[:item_purchase])
      flash[:notice] = "Successfully updated item_purchase."
      redirect_to @item_purchase
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item_purchase = Item_purchase.find(params[:id])
    @item_purchase.destroy
    flash[:notice] = "Successfully destroyed animal."
    redirect_to item_purchases_url
  end
end