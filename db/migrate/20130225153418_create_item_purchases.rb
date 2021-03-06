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
      t.string :actual_storage_location
      t.boolean :location_overridden, :default => false
      t.timestamps
    end
  end
end
