# The controller defined below is the tax controller,
#
#  Some methods are stubbed out for you to implement them from scratch
# while others may contain one or two bugs
#
# NB: Check the BACKEND CHALLENGE TEMPLATE DOCUMENTATION linked in the readme of this repository
# to see our recommended endpoints, request body/param, and response object for each of these method

class TaxController < ApplicationController
  before_action :authenticate_request!
  # get all tax types
  def get_all_tax
    taxes = Tax.all
    json_response(taxes)
  end

  # get a single tax type using tax id
  def get_single_tax
    tax = Tax.find_by_tax_id(tax_id)
    json_response(tax)
  end

  private

  def tax_id
    params.require(:tax_id)
  end
end
