class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :_id
      t.string :name
      t.string :generic_name
      t.string :storage_location
      t.string :category
      t.integer :est_shelf_life

      t.timestamps
    end
  end
end
