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

ActiveRecord::Schema.define(version: 20140619145452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companias", force: true do |t|
    t.string "nombre"
  end

  add_index "companias", ["nombre"], name: "index_companias_on_nombre", using: :btree

  create_table "episodios", force: true do |t|
    t.integer "nhc"
    t.date    "fecha_alta"
    t.boolean "es_ambulante"
    t.integer "compania_id"
    t.integer "medico_id"
  end

  create_table "especialidades", force: true do |t|
    t.string "nombre"
  end

  add_index "especialidades", ["nombre"], name: "index_especialidades_on_nombre", using: :btree

  create_table "medicos", force: true do |t|
    t.string  "nombre"
    t.string  "apellidos"
    t.integer "especialidad_id"
  end

  create_table "precios", force: true do |t|
    t.decimal "importe"
    t.integer "vigencia"
    t.boolean "incluido_en_forfait"
    t.integer "compania_id"
    t.integer "tipo_coste_con_tarifa_id"
  end

  add_index "precios", ["vigencia"], name: "index_precios_on_vigencia", using: :btree

  create_table "subtipos_coste", force: true do |t|
    t.string "descripcion"
  end

  add_index "subtipos_coste", ["descripcion"], name: "index_subtipos_coste_on_descripcion", using: :btree

  create_table "tipos_coste_con_tarifa", force: true do |t|
    t.string  "concepto"
    t.integer "subtipo_coste_id"
  end

  create_table "tipos_coste_sin_tarifa", force: true do |t|
    t.string  "concepto"
    t.integer "subtipo_coste_id"
  end

  add_index "tipos_coste_sin_tarifa", ["concepto"], name: "index_tipos_coste_sin_tarifa_on_concepto", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
