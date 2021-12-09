class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.integer :Year
      t.string :Industry_aggregation_NZSIOC
      t.string :Industry_code_NZSIOC
      t.string :Industry_name_NZSIOC
      t.string :Units
      t.string :Variable_code
      t.string :Variable_name
      t.string :Variable_category
      t.string :Value
      t.string :Industry_code_ANZSIC06
    end
  end
end
