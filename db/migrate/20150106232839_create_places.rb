class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
