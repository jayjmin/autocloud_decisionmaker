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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130508122622) do

  create_table "geos", :force => true do |t|
    t.string   "city"
    t.string   "continent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "operatingsystem_id"
    t.string   "imgid"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "images", ["operatingsystem_id"], :name => "index_images_on_operatingsystem_id"
  add_index "images", ["provider_id"], :name => "index_images_on_provider_id"

  create_table "jcloudnames", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "geo_id"
    t.string   "providername"
    t.string   "locationname"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "jcloudnames", ["geo_id"], :name => "index_jcloudnames_on_geo_id"
  add_index "jcloudnames", ["provider_id"], :name => "index_jcloudnames_on_provider_id"

  create_table "operatingsystems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rateelems", :force => true do |t|
    t.integer  "rate_id"
    t.string   "item"
    t.integer  "period_hour"
    t.float    "price_period"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "rateelems", ["rate_id"], :name => "index_rateelems_on_rate_id"

  create_table "rates", :force => true do |t|
    t.integer  "resourceset_id"
    t.integer  "servicetype_id"
    t.integer  "operatingsystem_id"
    t.integer  "geo_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "rates", ["geo_id"], :name => "index_rates_on_geo_id"
  add_index "rates", ["operatingsystem_id"], :name => "index_rates_on_operatingsystem_id"
  add_index "rates", ["resourceset_id"], :name => "index_rates_on_resourceset_id"
  add_index "rates", ["servicetype_id"], :name => "index_rates_on_servicetype_id"

  create_table "resourcesets", :force => true do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.float    "cpu"
    t.float    "ram"
    t.float    "hdd"
    t.boolean  "iscustomizable"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "resourcesets", ["provider_id"], :name => "index_resourcesets_on_provider_id"

  create_table "servicetypes", :force => true do |t|
    t.string   "stype"
    t.integer  "contract_day"
    t.boolean  "isstable"
    t.boolean  "isflexiblefee"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
