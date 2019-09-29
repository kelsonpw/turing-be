class CreateShoppingCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_cart_product, primary_key: ["cart_id", "product_id"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "cart_id", null: false
      t.integer "product_id", null: false
      t.index ["cart_id"], name: "idx_shopping_cart_product_cart_id"
      t.index ["product_id"], name: "idx_shopping_cart_product_product_id"
      t.timestamps
    end
  end
end
