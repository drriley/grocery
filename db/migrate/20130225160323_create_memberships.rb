class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :customer_id
      t.integer :company_id
      t.string :loyalty_id

      t.timestamps
    end
  end
end
