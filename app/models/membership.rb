class Membership < ActiveRecord::Base
  attr_accessible :company_id, :customer_id, :loyalty_id
end
