class ItemStoresController < ApplicationController

  def index
    @item_stores = ItemStore.all
  end

  def show
      @item_store = ItemStore.find(params[:id])
  end

  def new
    @item_store = ItemStore.new
  end

  def edit
    @item_store = ItemStore.find(params[:id])
  end

  def create
    @item_store = ItemStore.new(params[:item_store])
    if @item_store.save
      flash[:notice] = "Successfully created item_store."
      redirect_to @item_store
    else
      render :action => 'new'
    end
  end

  def update
    @item_store = ItemStore.find(params[:id])
    if @item_store.update_attributes(params[:item_store])
      flash[:notice] = "Successfully updated item_store."
      redirect_to @item_store
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item_store = ItemStore.find(params[:id])
    @item_store.destroy
    flash[:notice] = "Successfully destroyed item_store."
    redirect_to item_stores_url
  end
end