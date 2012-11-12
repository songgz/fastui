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

ActiveRecord::Schema.define(:version => 20121018013512) do

  create_table "fastui_m_actions", :force => true do |t|
    t.string   "title"
    t.string   "event_type"
    t.string   "event_name"
    t.integer  "m_tab_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fastui_m_actions", ["m_tab_id"], :name => "index_fastui_m_actions_on_m_tab_id"

  create_table "fastui_m_columns", :force => true do |t|
    t.integer  "m_tab_id"
    t.string   "title",         :limit => 60,                :null => false
    t.string   "note"
    t.string   "name",          :limit => 20
    t.integer  "m_property_id"
    t.integer  "width"
    t.string   "entity_kind",   :limit => 20
    t.integer  "seq",                         :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                      :default => 0
    t.integer  "createdby",                   :default => 0
    t.integer  "updatedby",                   :default => 0
    t.string   "help"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "fastui_m_data_types", :force => true do |t|
    t.string   "title",       :limit => 60,                :null => false
    t.string   "note"
    t.string   "name",        :limit => 20,                :null => false
    t.string   "entity_kind", :limit => 20
    t.integer  "seq",                       :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                    :default => 0
    t.integer  "createdby",                 :default => 0
    t.integer  "updatedby",                 :default => 0
    t.string   "help"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "fastui_m_entities", :force => true do |t|
    t.string   "title",        :limit => 60,                :null => false
    t.string   "note"
    t.string   "name",         :limit => 20,                :null => false
    t.integer  "access_level"
    t.string   "entity_kind",  :limit => 20
    t.integer  "seq",                        :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                     :default => 0
    t.integer  "createdby",                  :default => 0
    t.integer  "updatedby",                  :default => 0
    t.string   "help"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "fastui_m_fields", :force => true do |t|
    t.integer  "m_tab_id"
    t.string   "title",         :limit => 60,                 :null => false
    t.string   "note",                        :default => ""
    t.string   "name",          :limit => 20
    t.integer  "m_property_id"
    t.boolean  "displayed"
    t.boolean  "read"
    t.string   "entity_kind",   :limit => 20
    t.integer  "seq",                         :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                      :default => 0
    t.integer  "createdby",                   :default => 0
    t.integer  "updatedby",                   :default => 0
    t.string   "help"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "fastui_m_glossaries", :force => true do |t|
    t.string   "title",       :limit => 60,                :null => false
    t.string   "note"
    t.string   "name",        :limit => 20,                :null => false
    t.string   "entity_kind", :limit => 20
    t.integer  "seq",                       :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                    :default => 0
    t.integer  "createdby",                 :default => 0
    t.integer  "updatedby",                 :default => 0
    t.string   "help"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "fastui_m_glossary_items", :force => true do |t|
    t.integer  "m_glossary_id"
    t.string   "title",         :limit => 60,                :null => false
    t.string   "note"
    t.string   "name",          :limit => 20,                :null => false
    t.string   "entity_kind",   :limit => 20
    t.integer  "seq",                         :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                      :default => 0
    t.integer  "createdby",                   :default => 0
    t.integer  "updatedby",                   :default => 0
    t.string   "help"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "fastui_m_menu_items", :force => true do |t|
    t.string   "title",       :limit => 60,                :null => false
    t.integer  "m_window_id"
    t.boolean  "actived"
    t.integer  "org_id",                    :default => 0
    t.integer  "createdby",                 :default => 0
    t.integer  "updatedby",                 :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "fastui_m_menu_items", ["m_window_id"], :name => "index_fastui_m_menu_items_on_m_window_id"

  create_table "fastui_m_menus", :force => true do |t|
    t.string   "title",      :limit => 60,                :null => false
    t.boolean  "actived"
    t.integer  "org_id",                   :default => 0
    t.integer  "createdby",                :default => 0
    t.integer  "updatedby",                :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "fastui_m_orgs", :force => true do |t|
    t.string   "name",       :limit => 60,                :null => false
    t.boolean  "actived"
    t.integer  "org_id",                   :default => 0
    t.integer  "createdby",                :default => 0
    t.integer  "updatedby",                :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "fastui_m_people", :force => true do |t|
    t.string   "name",       :limit => 60,                :null => false
    t.boolean  "actived"
    t.integer  "org_id",                   :default => 0
    t.integer  "createdby",                :default => 0
    t.integer  "updatedby",                :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "fastui_m_properties", :force => true do |t|
    t.integer  "m_entity_id"
    t.string   "title",        :limit => 60,                 :null => false
    t.string   "note",                       :default => ""
    t.string   "name",         :limit => 20,                 :null => false
    t.integer  "refable_id"
    t.string   "refable_type"
    t.string   "entity_kind",  :limit => 20
    t.integer  "seq",                        :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                     :default => 0
    t.integer  "createdby",                  :default => 0
    t.integer  "updatedby",                  :default => 0
    t.string   "help"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "fastui_m_tabs", :force => true do |t|
    t.integer  "m_window_id"
    t.string   "title",       :limit => 60,                :null => false
    t.string   "note"
    t.boolean  "read"
    t.integer  "m_entity_id"
    t.string   "entity_kind", :limit => 20
    t.integer  "seq",                       :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                    :default => 0
    t.integer  "createdby",                 :default => 0
    t.integer  "updatedby",                 :default => 0
    t.string   "help"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "fastui_m_windows", :force => true do |t|
    t.string   "title",       :limit => 60,                :null => false
    t.string   "note"
    t.string   "kind"
    t.string   "entity_kind", :limit => 20
    t.integer  "seq",                       :default => 0
    t.boolean  "actived"
    t.integer  "org_id",                    :default => 0
    t.integer  "createdby",                 :default => 0
    t.integer  "updatedby",                 :default => 0
    t.string   "help"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
