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

ActiveRecord::Schema.define(version: 20160513115343) do

  create_table "Afp", primary_key: "idAfp", force: :cascade do |t|
    t.char    "Seguro",      limit: 18
    t.decimal "Tasa",                   precision: 9, scale: 2
    t.char    "Descripcion", limit: 18
  end

  create_table "Concepto", primary_key: "idConcepto", force: :cascade do |t|
    t.char "Nombre",         limit: 18
    t.char "idTipoConcepto", limit: 18
  end

  create_table "DetaPlanilla", primary_key: "idPlanilla", force: :cascade do |t|
    t.char    "idConcepto", limit: 18,                         null: false
    t.decimal "Monto",                 precision: 9, scale: 0
  end

  create_table "MesProceso", primary_key: "idMes", force: :cascade do |t|
    t.char "Anual",         limit: 18
    t.char "Mes",           limit: 18
    t.date "FechaEmision"
    t.date "FechaDeposito"
    t.date "FechaInicial"
    t.date "FechaFinal"
  end

  create_table "Parametro", primary_key: "idParametro", force: :cascade do |t|
    t.char "UIT",    limit: 18
    t.char "Fecha",  limit: 18
    t.char "Estado", limit: 18
  end

  create_table "Planilla", primary_key: "idPlanilla", force: :cascade do |t|
    t.char    "idAfp",           limit: 18
    t.char    "idTrabajador",    limit: 18
    t.char    "idMes",           limit: 18
    t.char    "DiasFalta",       limit: 18
    t.char    "HorasFalta",      limit: 18
    t.decimal "TotalIngresos",              precision: 9, scale: 2
    t.decimal "TotalDescuentos",            precision: 9, scale: 2
  end

  create_table "ResumenHorario", primary_key: "idResHorario", force: :cascade do |t|
    t.integer "DiasFalta",    limit: 4
    t.decimal "HorasFalta",              precision: 7, scale: 2
    t.char    "idTrabajador", limit: 18
    t.char    "idMes",        limit: 18
  end

  create_table "TipoConcepto", primary_key: "idTipoConcepto", force: :cascade do |t|
    t.char    "Descripcion", limit: 18
    t.integer "signo",       limit: 4
  end

  create_table "Trabajador", primary_key: "idTrabajador", force: :cascade do |t|
    t.char    "Apellidos",    limit: 18
    t.char    "Nombres",      limit: 18
    t.char    "Direccion",    limit: 18
    t.char    "Estado",       limit: 18
    t.char    "idAfp",        limit: 18
    t.char    "FechaIngreso", limit: 18
    t.decimal "Basico",                  precision: 9, scale: 2
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: :cascade do |t|
    t.string  "name",         limit: 128,        null: false
    t.integer "principal_id", limit: 4,          null: false
    t.integer "version",      limit: 4
    t.binary  "definition",   limit: 2147483647
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

  add_foreign_key "Concepto", "TipoConcepto", column: "idTipoConcepto", primary_key: "idTipoConcepto", name: "R_6"
  add_foreign_key "DetaPlanilla", "Concepto", column: "idConcepto", primary_key: "idConcepto", name: "R_7"
  add_foreign_key "DetaPlanilla", "Planilla", column: "idPlanilla", primary_key: "idPlanilla", name: "R_5"
  add_foreign_key "Planilla", "MesProceso", column: "idMes", primary_key: "idMes", name: "R_9"
  add_foreign_key "Planilla", "Trabajador", column: "idTrabajador", primary_key: "idTrabajador", name: "R_1"
  add_foreign_key "ResumenHorario", "MesProceso", column: "idMes", primary_key: "idMes", name: "R_19"
  add_foreign_key "ResumenHorario", "Trabajador", column: "idTrabajador", primary_key: "idTrabajador", name: "R_10"
  add_foreign_key "Trabajador", "Afp", column: "idAfp", primary_key: "idAfp", name: "R_4"
end
