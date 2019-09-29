class Review < ApplicationRecord
  self.table_name = "review"

  belongs_to :customer
  belongs_to :product

  validates_presence_of :review
  validates_presence_of :rating
end
