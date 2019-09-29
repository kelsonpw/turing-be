class ProductAttribute < ApplicationRecord
  self.table_name = "product_attribute"

  belongs_to :product, :foreign_key => "product_id"

  has_many :values, :primary_key => "attribute_value_id", :foreign_key => "attribute_value_id", :class_name => "AttributeValue"
end
