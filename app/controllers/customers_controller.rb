class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.for_user(current_user.id)
	end
end