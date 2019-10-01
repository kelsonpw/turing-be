# The controller defined below is the shopping cart controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class ShoppingCartController < ApplicationController
  require "securerandom"
  # generate random unique id for cart identifier
  def generate_unique_cart
    unique_cart = ShoppingCart.generate_with_uuid

    if unique_cart.save!
      json_response(:cart_id => unique_cart.cart_id)
    else
      json_response({ message: "Error" })
    end
  end

  # add item to existing cart with cart id
  def add_item_to_cart
    shopping_cart = ShoppingCart.find(shopping_cart_add_params["cart_id"])

    products = shopping_cart.shopping_cart_products
    product_addition = products.new(
      product_id: params[:product_id],
      product_attributes: params[:product_attributes].split(", "),
    )

    if product_addition.save
      cart_items = products.map do |shopping_cart_product|
        product = shopping_cart_product.product.attributes.except("display", "thumbnail", "image", "image_2")
        product["item_id"] = shopping_cart_product.item_id
        product
      end
      json_response(cart_items)
    else
      json_response({ message: "Error" })
    end
  end

  # get all items in a shopping cart using cart id
  def get_cart
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # update quantity of an item in a shopping cart
  def update_cart_item
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # remove all items from a shopping cart
  def empty_cart
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # remove a specific item from a shopping cart
  def remove_item_from_cart
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # create order for all items in a shopping cart
  def create_order
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # get all orders placed by a customer
  def get_customer_orders
    json_response({ message: "NOT IMPLEMENTED" })
  end

  # get details of items in an order
  def get_order_summary
    authenticate_request!
    order = Order.find(params[:order_id])

    json_response(order)
  end

  # checkout order and process stripe payment
  def process_stripe_payment
    json_response({ message: "NOT IMPLEMENTED" })
  end

  private

  def shopping_cart_add_params
    params.permit(:cart_id, :product_id, :product_attributes)
  end
end
