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

ActiveRecord::Schema.define(version: 20180318065626) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "order_placed"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
  end

  create_table "product_lists", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image"
    t.integer  "position"
    t.integer  "category_id"
    t.boolean  "is_hidden",   default: false
    t.integer  "discount"
    t.string   "friendly_id"
    t.index ["friendly_id"], name: "index_products_on_friendly_id", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tbl_checks", force: :cascade do |t|
    t.integer  "扣款合计"
    t.integer  "安全业绩扣款"
    t.integer  "生产经营绩效扣款"
    t.integer  "总重吨公里扣款"
    t.integer  "综合指标扣款"
    t.integer  "设备质量扣款"
    t.integer  "盈亏结果扣款"
    t.integer  "安全质量扣款"
    t.integer  "安全质量考核中牌卡扣分"
    t.integer  "安全质量考核中牌卡扣款"
    t.integer  "工作质量扣款"
    t.integer  "抽考扣款"
    t.integer  "红牌中层扣款"
    t.integer  "处分扣款"
    t.integer  "其他扣款"
    t.string   "科室车间"
    t.integer  "序号"
    t.integer  "挂钩考核扣款"
    t.float    "安全业绩扣分"
    t.float    "总重吨公里扣分"
    t.float    "综合指标扣分"
    t.float    "设备质量扣分"
    t.float    "盈亏结果扣分"
    t.float    "安全质量扣分"
    t.float    "工作质量扣分"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["序号"], name: "index_tbl_checks_on_序号", unique: true
  end

  create_table "tbl_salers", force: :cascade do |t|
    t.string  "部门班组"
    t.string  "姓名"
    t.float   "系数",    limit: 24
    t.decimal "挂钩",               precision: 10
    t.integer "安全质量"
    t.integer "工作质量"
    t.integer "一体化"
    t.integer "兼职兼岗"
    t.integer "应发"
    t.integer "考核扣款"
    t.string  "备注"
    t.string  "科室车间"
    t.integer "其他"
    t.string  "单项奖"
    t.integer "单项奖金额"
    t.integer "车间编号"
    t.integer "车间序号"
    t.integer "序号"
    t.string  "人员分类"
    t.integer "综合"
    t.integer "捆挂"
    t.integer "安全"
    t.integer "效益"
    t.integer "小计"
    t.string  "职务"
    t.float   "原系数备份", limit: 24
    t.index [nil], name: "index_tbl_salers_on_工资号", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "username"
    t.string   "avatar"
    t.string   "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
