class CreateOchiais < ActiveRecord::Migration
  def change
    create_table :ochiais do |t|
      t.string :url

      t.timestamps
    end
  end
end
