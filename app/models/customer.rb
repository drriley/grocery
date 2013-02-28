class Customer < ActiveRecord::Base
  has_many :memberships
  has_many :purchases
  attr_accessible :email, :first_name, :last_name, :phone, :street, :zip
end
