class User < ActiveRecord::Base
	# Include default devise modules. 
	# Others available are:
	# :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable


	# Callbacks
	# after_create :create_customer

	# this isn't working right now - 
	# need to figure out how models will get created when someone registers. 
	# customer model first or user model first?
	# use virtual attributes??


	# Attributes

	# Setup accessible (or protected) attributes for model
	attr_accessible :email, :password, :password_confirmation, :remember_me
	# attr_accessible :title, :body


	# Relationships
	has_one :customer, :dependent => :destroy


	# Methods
	def customer_id
		return Customer.where('user_id = ?', self.id).first.id
	end

	def customer
		return Customer.where('user_id = ?', self.id).first
	end


	def first_name
		full_name = Customer.find(self.customer_id).proper_name
		first_name = full_name.split(' ')[0]
		return first_name
	end


	# Callback Methods

    # create a customer model for each user (since we only have one role at the moment)
    # def create_customer
	# 	@customer = Customer.new
	# 	@customer.user = self
	# 	@customer.save!
	# end
end
