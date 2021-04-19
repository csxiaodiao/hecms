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

ActiveRecord::Schema.define(version: 2021_04_13_015526) do

  create_table "hecms_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "seo_title"
    t.string "keywords"
    t.text "description"
    t.string "slug"
    t.boolean "enabled", default: true
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_hecms_categories_on_deleted_at"
    t.index ["lft"], name: "index_hecms_categories_on_lft"
    t.index ["parent_id"], name: "index_hecms_categories_on_parent_id"
    t.index ["rgt"], name: "index_hecms_categories_on_rgt"
    t.index ["slug"], name: "index_hecms_categories_on_slug", unique: true
  end

end
