class Review < ApplicationRecord
  self.table_name = "review"

  belongs_to :customer
  belongs_to :product
end
