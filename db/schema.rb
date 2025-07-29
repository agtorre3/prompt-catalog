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

ActiveRecord::Schema[8.0].define(version: 2025_07_29_015054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "character_traits", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "trait_id"], name: "index_character_traits_on_character_id_and_trait_id", unique: true
    t.index ["character_id"], name: "index_character_traits_on_character_id"
    t.index ["trait_id"], name: "index_character_traits_on_trait_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "external_id"
  end

  create_table "prompt_character_traits", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.bigint "character_trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_trait_id"], name: "index_prompt_character_traits_on_character_trait_id"
    t.index ["prompt_id", "character_trait_id"], name: "idx_on_prompt_id_character_trait_id_91dc567766", unique: true
    t.index ["prompt_id"], name: "index_prompt_character_traits_on_prompt_id"
  end

  create_table "prompt_characters", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_prompt_characters_on_character_id"
    t.index ["prompt_id"], name: "index_prompt_characters_on_prompt_id"
  end

  create_table "prompt_relationships", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.bigint "relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id", "relationship_id"], name: "index_prompt_relationships_on_prompt_id_and_relationship_id", unique: true
    t.index ["prompt_id"], name: "index_prompt_relationships_on_prompt_id"
    t.index ["relationship_id"], name: "index_prompt_relationships_on_relationship_id"
  end

  create_table "prompt_tags", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_prompt_tags_on_prompt_id"
    t.index ["tag_id"], name: "index_prompt_tags_on_tag_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_prompts_on_user_id"
  end

  create_table "relationship_members", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_relationship_members_on_character_id"
    t.index ["relationship_id", "character_id"], name: "index_relationship_members_on_relationship_id_and_character_id", unique: true
    t.index ["relationship_id"], name: "index_relationship_members_on_relationship_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "relationship_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_category_id"], name: "index_tags_on_tag_category_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_traits_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "character_traits", "characters"
  add_foreign_key "character_traits", "traits"
  add_foreign_key "prompt_character_traits", "character_traits"
  add_foreign_key "prompt_character_traits", "prompts"
  add_foreign_key "prompt_characters", "characters"
  add_foreign_key "prompt_characters", "prompts"
  add_foreign_key "prompt_relationships", "prompts"
  add_foreign_key "prompt_relationships", "relationships"
  add_foreign_key "prompt_tags", "prompts"
  add_foreign_key "prompt_tags", "tags"
  add_foreign_key "prompts", "users"
  add_foreign_key "relationship_members", "characters"
  add_foreign_key "relationship_members", "relationships"
  add_foreign_key "tags", "tag_categories"
end
