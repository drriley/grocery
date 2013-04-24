class AddOverrideFieldsForItemPurchase < ActiveRecord::Migration
  def up
    unknown = Store.new
    unknown.name = "Unknown"
    unknown.phone = "1234567890"
    unknown.zip = "12345"
    unknown.street = "Unknown Street"
    unknown.save
  end

  def down
    unknown = Store.find(:first, :conditions => ["name = ?", "Unknown"])
    Store.delete unknown
  end
end
