class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :_id
      t.integer :customer_id
      t.date :date

      t.timestamps
    end
  end
end
