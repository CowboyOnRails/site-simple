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

ActiveRecord::Schema.define(:version => 20120311110933) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.integer  "position",    :default => 1
    t.boolean  "home",        :default => false
    t.integer  "parent_id",   :default => 0
    t.integer  "metaitem_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "top",         :default => false
  end

  add_index "articles", ["metaitem_id"], :name => "index_articles_on_metaitem_id"
  add_index "articles", ["parent_id"], :name => "index_articles_on_parent_id"
  add_index "articles", ["position"], :name => "index_articles_on_position"
  add_index "articles", ["slug"], :name => "index_articles_on_slug"

  create_table "images", :force => true do |t|
    t.string   "image_uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "phone1"
    t.string   "phone2"
    t.text     "adress"
    t.string   "email"
    t.string   "sitename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "copyright"
  end

  create_table "metaitems", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.integer  "article_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "metaitems", ["article_id"], :name => "index_metaitems_on_article_id"

end
