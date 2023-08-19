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

ActiveRecord::Schema[7.0].define(version: 2023_08_12_110911) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "issue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_bookmarks_on_issue_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "issue_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_comments_on_issue_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "issue_tags", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_issue_tags_on_issue_id"
    t.index ["tag_id"], name: "index_issue_tags_on_tag_id"
  end

  create_table "issues", force: :cascade do |t|
    t.boolean "assigned"
    t.boolean "available", default: true
    t.integer "category"
    t.boolean "completed"
    t.string "description"
    t.bigint "gh_id"
    t.datetime "gh_issue_created_at"
    t.string "repo_name"
    t.integer "repo_stars"
    t.string "repo_url"
    t.string "title"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "gh_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "issues"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "issues"
  add_foreign_key "comments", "users"
  add_foreign_key "issue_tags", "issues"
  add_foreign_key "issue_tags", "tags"
  add_foreign_key "issues", "users"
end
