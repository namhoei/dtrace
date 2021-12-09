class CreateGeos < ActiveRecord::Migration[6.1]
  def change
    create_table :geos do |t|
      t.string :anzsic06
      t.string :Area
      t.integer :year
      t.integer :geo_count
      t.integer :ec_count
    end
  end
end
