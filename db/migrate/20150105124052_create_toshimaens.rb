class CreateToshimaens < ActiveRecord::Migration
  def change
    create_table :toshimaens do |t|
      t.string :url

      t.timestamps
    end
  end
end
