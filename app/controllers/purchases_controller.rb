class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
      @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    if @purchase.save
      flash[:notice] = "Successfully created purchase."
      redirect_to @purchase
    else
      render :action => 'new'
    end
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update_attributes(params[:purchase])
      flash[:notice] = "Successfully updated purchase."
      redirect_to @purchase
    else
      render :action => 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = "Successfully destroyed purchase."
    redirect_to purchases_url
  end
end