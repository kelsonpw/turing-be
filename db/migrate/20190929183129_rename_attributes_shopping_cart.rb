class RenameAttributesShoppingCart < ActiveRecord::Migration[5.2]
  def up
    rename_column :shopping_cart, :attributes, :shopping_cart_attributes
  end

  def down
    rename_column :shopping_cart, :shopping_cart_attributes, :attributes
  end
end
