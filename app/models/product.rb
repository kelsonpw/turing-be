class Product < ApplicationRecord
  self.table_name = "product"

  has_many :product_attributes, :foreign_key => "product_id"
  has_many :product_categories
  has_many :reviews
  has_many :categories, :through => :product_categories

  def self.search(query:, description_length:, page:, limit:)
    conditions = ["name LIKE :query && length(description) < :description_length", {
      query: "%#{query}%",
      description_length: description_length,
    }]
    where(*conditions)
      .page(page)
      .per(limit)
  end
end
