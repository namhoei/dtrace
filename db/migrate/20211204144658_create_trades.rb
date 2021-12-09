class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.string :Series_reference
      t.string :Period
      t.string :Data_value
      t.string :STATUS
      t.string :UNITS
      t.string :MAGNTUDE
      t.string :Subject
      t.string :Group
      t.string :Series_title_1
      t.string :Series_title_2
      t.string :Series_title_3
      t.string :Series_title_4
      t.string :Series_title_5
    end
  end
end
