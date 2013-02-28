class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
     # get data on that particular animal
      @customer = Customer.find(params[:id])
     
      
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = "Successfully created Customer."
      redirect_to @customer
    else
      render :action => 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = "Successfully updated customer."
      redirect_to @customer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Successfully destroyed animal."
    redirect_to customers_url
  end
end