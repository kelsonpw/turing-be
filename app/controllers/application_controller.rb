class ApplicationController < ActionController::API
  require "jsonwebtoken"
  include Response

  def welcome
    json_response({ message: "Welcome to Turing E-commerce shop api, your goal is to implement the missing code or fix the bugs inside this project" })
  end

  protected

  # Validates the token and customer and sets the @current_customer scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_customer!
    invalid_authentication unless @current_customer
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    json_response({ error: "Invalid Request" }, status: :unauthorized)
  end

  def current_customer
    @current_customer
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers["Authorization"]
    token = auth_header.split(" ").last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  # Sets the @current_customer with the customer_id from payload
  def load_current_customer!
    @current_customer = Customer.find(payload.first["customer_id"])
  end
end
