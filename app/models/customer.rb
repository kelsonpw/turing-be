class Customer < ApplicationRecord
  self.table_name = "customer"

  has_many :reviews
end
