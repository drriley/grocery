class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.boolean :visible_in_list, :default => true
      t.boolean :purchased_yet, :default => false
      
      t.timestamps
    end
  end
end
