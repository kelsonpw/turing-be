class ShoppingCart < ApplicationRecord
  self.table_name = "shopping_cart"

  def self.generate_with_uuid
    new(cart_id: SecureRandom.uuid[0..7])
  end
end
