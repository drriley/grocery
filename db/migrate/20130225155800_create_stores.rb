class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :company_id
      t.integer :store_number
      t.string :phone
      t.string :street
      t.string :zip

      t.timestamps
    end
  end
end
