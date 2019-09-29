class Department < ApplicationRecord
  self.table_name = "department"

  has_many :categories, :foreign_key => "department_id"
end
