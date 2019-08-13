# The controller defined below is the customer controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class CustomerController < ApplicationController
  # create a new customer account
  def create
    json_response({ message: 'NOT IMPLEMENTED' })
  end

  # login a customer account
  def login
    json_response({ message: 'NOT IMPLEMENTED' })
  end

  # get the logged in customer profile
  def get_customer_profile
    json_response({ message: 'NOT IMPLEMENTED' })
  end

  # update a customer profile such as
  # name, email, password, day_phone, eve_phone and mob_phone
  def update_customer_profile
    json_response({ message: 'NOT IMPLEMENTED' })
  end

  # update a customer billing info such as
  # address_1, address_2, city, region, postal_code, country and shipping_region_id
  def update_customer_address
    json_response({ message: 'NOT IMPLEMENTED' })
  end

  # update a customer credit card
  def update_credit_card
    json_response({ message: 'NOT IMPLEMENTED' })
  end
end
