class CreateItemPurchases < ActiveRecord::Migration
  def change
    create_table :item_purchases do |t|
      t.integer :_id
      t.integer :purchase_id
      t.integer :item_store_id
      t.float :quantity
      t.text :unit
      t.float :price_per_unit
      t.integer :status
      t.string :override_storage_location, :default => ''
      t.timestamps
    end
  end
end
