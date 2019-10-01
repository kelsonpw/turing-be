class ChangeCustomerPasswordColumn < ActiveRecord::Migration[5.2]
  def up
    rename_column :customer, :password, :password_digest
  end

  def down
    rename_column :customer, :password_digest, :password
  end
end
