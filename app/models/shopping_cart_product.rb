class ShoppingCartProduct < ApplicationRecord
  self.table_name = "shopping_cart_product"

  belongs_to :shopping_cart, :foreign_key => "cart_id"
  belongs_to :product
end
