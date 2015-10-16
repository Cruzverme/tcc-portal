# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151016032149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cursos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.integer  "coordenador_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.integer  "workload"
    t.text     "ementa"
    t.text     "description"
    t.text     "bibliography"
    t.integer  "curso_id"
    t.integer  "professor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "disciplines", ["curso_id"], name: "index_disciplines_on_curso_id", using: :btree

  create_table "registration_courses", force: :cascade do |t|
    t.date     "admission_date"
    t.boolean  "locked"
    t.date     "conclusion_date"
    t.integer  "curso_id"
    t.integer  "aluno_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "registration_courses", ["curso_id"], name: "index_registration_courses_on_curso_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role",                   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "disciplines", "cursos"
  add_foreign_key "registration_courses", "cursos"
end
