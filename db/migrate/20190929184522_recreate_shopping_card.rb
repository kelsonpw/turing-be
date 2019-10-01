class RecreateShoppingCard < ActiveRecord::Migration[5.2]
  def change
    drop_table "shopping_cart"
    create_table "shopping_cart", primary_key: "item_id", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "cart_id", limit: 32, null: false
      t.integer "product_id", null: true
      t.string "shopping_cart_attributes", null: true
      t.integer "quantity", default: 0, null: false
      t.boolean "buy_now", default: true, null: false
      t.datetime "added_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["cart_id"], name: "idx_shopping_cart_cart_id"
    end
  end
end
