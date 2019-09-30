class CorrectPrimaryKey < ActiveRecord::Migration[5.2]
  def change
    create_table "shopping_cart", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "cart_id", limit: 32, null: false, primary_key: true, unique: true
      t.integer "product_id"
      t.string "shopping_cart_attributes"
      t.integer "quantity", default: 0, null: false
      t.boolean "buy_now", default: true, null: false
      t.datetime "added_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["cart_id"], name: "idx_shopping_cart_cart_id"
    end
  end
end
