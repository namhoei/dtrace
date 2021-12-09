# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_04_144703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geos", force: :cascade do |t|
    t.string "anzsic06"
    t.string "Area"
    t.integer "year"
    t.integer "geo_count"
    t.integer "ec_count"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "Year"
    t.string "Industry_aggregation_NZSIOC"
    t.string "Industry_code_NZSIOC"
    t.string "Industry_name_NZSIOC"
    t.string "Units"
    t.string "Variable_code"
    t.string "Variable_name"
    t.string "Variable_category"
    t.string "Value"
    t.string "Industry_code_ANZSIC06"
  end

  create_table "trades", force: :cascade do |t|
    t.string "Series_reference"
    t.string "Period"
    t.string "Data_value"
    t.string "STATUS"
    t.string "UNITS"
    t.string "MAGNTUDE"
    t.string "Subject"
    t.string "Group"
    t.string "Series_title_1"
    t.string "Series_title_2"
    t.string "Series_title_3"
    t.string "Series_title_4"
    t.string "Series_title_5"
  end

end
