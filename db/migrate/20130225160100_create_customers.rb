class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone
      t.string :street
      t.string :zip
      t.integer :user_id

      t.timestamps
    end
  end
end
