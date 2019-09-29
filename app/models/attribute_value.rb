class AttributeValue < ApplicationRecord
  self.table_name = "attribute_value"

  belongs_to :parent_attribute, :foreign_key => "attribute_value_id", :class_name => "Attribute"
  belongs_to :product_attribute, :foreign_key => "attribute_value_id", :primary_key => "attribute_value_id", :class_name => "ProductAttribute"
end
