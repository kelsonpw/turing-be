class ShoppingCart < ApplicationRecord
  self.table_name = "shopping_cart"

  has_many :shopping_cart_products, :foreign_key => "cart_id"
  has_many :products, through: :shopping_cart_products, :foreign_key => "cart_id"

  def self.generate_with_uuid
    new(cart_id: SecureRandom.uuid[0..7])
  end
end
