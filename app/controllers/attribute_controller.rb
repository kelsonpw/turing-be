# The controller defined below is the attribute controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class AttributeController < ApplicationController
  # get all attributes
  def get_all_attributes
    attributes = Attribute.all
    json_response(attributes)
  end

  # get a single attribute using the attribute_id in the request parameter
  def get_single_attribute
    attribute = Attribute.find(params[:attribute_id])
    json_response(attribute)
  end

  # get all attribute values of a single attribute using the attribute id
  def get_attribute_values
    attribute = Attribute.find(params[:attribute_id])
    values = attribute.values
    json_response(values, except: [:attribute_id])
  end

  # get all the attributes for a product
  def get_product_attributes
    product = Product.find(params[:product_id])
    attribute_values = product.product_attributes.map(&:values)
    json_response(attribute_values)
  end
end
