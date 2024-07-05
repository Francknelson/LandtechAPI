module AuthenticationHelper
  def auth_token
    post "/auth/login", params: { email: 'user@example.com', password: 'password' }
    json_response = JSON.parse(response.body)
    json_response["token"]
  end

  def json_response
    JSON.parse(response.body)
  end
end