class ApplicationController < ActionController::API
  include Response

  def welcome
    json_response({ message: 'Welcome to Turing E-commerce shop api, your goal is to implement the missing code or fix the bugs inside this project' })
  end
end
