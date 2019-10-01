class AddDefaultsToShoppingCart < ActiveRecord::Migration[5.2]
  def change
    change_column :shopping_cart, :product_id, :integer
    change_column :shopping_cart, :shopping_cart_attributes, :string
  end
end
