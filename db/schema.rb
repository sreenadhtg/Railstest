# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "students", :force => true do |t|
    t.string "name", :limit => 100, :null => false
    t.string "city", :limit => 100, :null => false
  end

  create_table "users", :primary_key => "userid", :force => true do |t|
    t.string "username", :limit => 20, :null => false
    t.string "password", :limit => 20, :null => false
  end

end
