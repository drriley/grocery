class AddOverrideFieldsForItemPurchase < ActiveRecord::Migration
  def up
    Store.create :name => "Unknown", :phone => "1234567890", :zip => "12345", :street => "Unknown Street"
  end

  def down
  end
end
