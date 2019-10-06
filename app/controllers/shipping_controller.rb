# The controller defined below is the shippiing controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class ShippingController < ApplicationController
  before_action :authenticate_request!
  # get all shipping regions
  def get_shipping_regions
    shipping_regions = ShippingRegion.all
    json_response(shipping_regions)
  end

  # get all shipping type for a shipping region
  def get_shipping_type
    shipping_region = ShippingRegion.find_by_shipping_region_id(shipping_region_id)
    json_response(shipping_region)
  end

  private

  def shipping_region_id
    params.require(:shipping_region_id)
  end
end
