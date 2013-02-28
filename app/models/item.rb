class Item < ActiveRecord::Base
  has_many :stores
  attr_accessible :est_shelf_life, :generic_name, :name
end
