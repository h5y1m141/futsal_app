class CreateNerimas < ActiveRecord::Migration
  def change
    create_table :nerimas do |t|
      t.string :url

      t.timestamps
    end
  end
end
