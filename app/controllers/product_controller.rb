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
    json_response(:count => products.length, :rows => products)
  end

  # get single product details
  def get_product
    product = Product.find(params[:product_id])
    json_response(product)
  end

  # search all products
  def search_product
    query_params = request.query_parameters
    search_query = query_params.fetch(:query_string, "")
    page = query_params.fetch(:page, 1)
    limit = query_params.fetch(:limit, 20)
    description_length = query_params.fetch(:description_length, 200)

    search_result = Product.search(
      query: search_query,
      description_length: description_length,
      page: page,
      limit: limit,
    )

    json_response(:count => search_result.length, :rows => search_result)
  end

  # get all products in a category
  def get_products_by_category
    category = Category.find(params[:category_id])
    products = category.products

    json_response(:count => products.length, :rows => products)
  end

  # get all products in a department
  def get_products_by_department
    department = Department.find(params[:department_id])
    categories = department.categories
    products = categories.flat_map(&:products)

    json_response(:count => products.length, :rows => products)
  end

  def get_product_locations
    product = Product.find(params[:product_id])
    locations = product.categories.map do |category|
      {
        category_id: category.category_id,
        category_name: category.name,
        department_id: category.department.department_id,
        department_name: category.department.name,
      }
    end

    json_response(locations)
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
    json_response(:count => categories.length, :rows => categories)
  end

  # get single category details
  def get_category
    category = Category.find(params[:category_id])
    json_response(category)
  end

  # get all categories in a department
  def get_department_categories
    department = Department.find(params[:department_id])
    categories = department.categories
    json_response(categories)
  end

  def get_product_categories
    product = Product.find(params[:product_id])
    categories = product.categories

    json_response(categories)
  end

  def get_product_reviews
    product = Product.find(params[:product_id])
    reviews = product.reviews.map do |review|
      {
        name: review.customer.name,
        review: review.review,
        rating: review.rating,
        created_on: review.created_on,
      }
    end

    json_response(reviews)
  end

  def create_product_review
    authenticate_request!

    product = Product.find(params[:product_id])

    new_review = Review.new(
      customer: current_customer,
      product: product,
      review: params[:review],
      rating: params[:rating],
    )
    new_review.save!

    json_response({})
  end
end
