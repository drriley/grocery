class CreateItemStores < ActiveRecord::Migration
  def change
    create_table :item_stores do |t|
      t.integer :_id
      t.integer :item_id
      t.integer :store_id

      t.timestamps
    end
  end
end
