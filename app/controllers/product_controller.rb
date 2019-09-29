# The controller defined below is the product controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class ProductController < ApplicationController
  # get all products
  def get_all_products
    products = Product.all
    json_response(products)
  end

  # get single product details
  def get_product
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # search all products
  def search_product
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # get all products in a category
  def get_products_by_category
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # get all products in a department
  def get_products_by_department
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # get all departments
  def get_all_departments
    departments = Department.all
    json_response(departments)
  end

  # get single department details
  def get_department
    department = Department.find(params[:department_id])
    json_response(department)
  end

  # get all categories
  def get_all_categories
    categories = Category.all
    json_response(categories)
  end

  # get single category details
  def get_category
    category = Category.find(params[:category_id])
    json_response(category)
  end

  # get all categories in a department
  def get_department_categories
    categories = Category.find_by_department_id(params[:department_id])
    json_response(categories)
  end

  def get_product_categories
    product_category = ProductCategory.find_by_product_id(params[:product_id])
    category = Category.find(product_category.category_id)
    json_response(category)
  end
end
