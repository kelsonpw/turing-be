module Response
  def json_response(response, status: :ok, except: [])
    render json: response, status: status, except: except
  end
end
