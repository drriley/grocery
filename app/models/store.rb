class Store < ActiveRecord::Base
  attr_accessible :company_id, :phone, :store_number, :street, :zip
end
