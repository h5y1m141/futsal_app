class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
