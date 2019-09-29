class Attribute < ApplicationRecord
  self.table_name = "attribute"

  has_many :values, :foreign_key => "attribute_id", :class_name => "AttributeValue"
end
