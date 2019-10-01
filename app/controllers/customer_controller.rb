# The controller defined below is the customer controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class CustomerController < ApplicationController
  # create a new customer account
  def create_customer_profile
    customer = Customer.new(customer_register_params)

    if customer.save! && customer.authenticate(customer_register_params[:password])
      customer_authorized_response(customer)
    else
      json_response({ errors: customer.errors.full_messages }, status: :bad_request)
    end
  end

  def login
    customer = Customer.find_by(email: customer_login_params[:email])

    if customer && customer.authenticate(customer_login_params[:password])
      customer_authorized_response(customer)
    else
      json_response({ error: "Invalid username / password" }, status: :unauthorized)
    end
  end

  # get the logged in customer profile
  def get_customer_profile
    authenticate_request!
    json_response(current_customer)
  end

  # update a customer profile such as
  # name, email, password, day_phone, eve_phone and mob_phone
  def update_customer_profile
    authenticate_request!
    current_customer.assign_attributes(customer_update_params)

    if current_customer.save!
      json_response(current_customer)
    else
      json_response({ errors: customer.errors.full_messages }, status: :bad_request)
    end
  end

  # update a customer billing info such as
  # address_1, address_2, city, region, postal_code, country and shipping_region_id
  def update_customer_address
    authenticate_request!
    current_customer.assign_attributes(customer_address_params)

    if current_customer.save!
      json_response(current_customer)
    else
      json_response({ errors: customer.errors.full_messages }, status: :bad_request)
    end
  end

  # update a customer credit card
  def update_credit_card
    authenticate_request!
    current_customer.assign_attributes(credit_card: customer_credit_card_param)

    if current_customer.save!
      json_response(current_customer)
    else
      json_response({ errors: customer.errors.full_messages }, status: :bad_request)
    end
  end

  private

  def customer_register_params
    params.permit(:name, :email, :password)
  end

  def customer_login_params
    params.permit(:email, :password)
  end

  def customer_update_params
    params.permit(:name, :password, :day_phone, :eve_phone, :mob_phone)
  end

  def customer_address_params
    params.permit(
      :address_1,
      :address_2,
      :city,
      :region,
      :postal_code,
      :country,
      :shipping_region_id
    )
  end

  def customer_credit_card_param
    params.require(:credit_card)
  end

  def customer_authorized_response(customer)
    auth_token = JsonWebToken.encode({ customer_id: customer.customer_id })
    json_response({
      customer: {
        schema: customer,
      },
      accessToken: JsonWebToken.bearer(auth_token),
      expires_in: JsonWebToken::EXPIRES_IN,
    })
  end
end
