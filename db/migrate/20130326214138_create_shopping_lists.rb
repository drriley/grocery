class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.integer :id
      t.integer :item_id
      t.integer :customer_id
      t.boolean :visible_in_list, :default => true
      t.boolean :purchased_yet, :default => false

      t.timestamps
    end
  end
end
