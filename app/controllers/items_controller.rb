class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
     # get data on that particular animal
      @item = Item.find(params[:id])
     
      
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Successfully created Item."
      redirect_to @item
    else
      render :action => 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Successfully updated item."
      redirect_to @item
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed animal."
    redirect_to items_url
  end
end