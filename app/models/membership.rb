class Membership < ActiveRecord::Base
  attr_accessible :company_id, :customer_id, :loyalty_id
  
  belongs_to :customer
  belongs_to :company
  
  validates_presence_of :company, :customer

  def company_name
  	return Company.find(self.company_id).name
  end
  
end
