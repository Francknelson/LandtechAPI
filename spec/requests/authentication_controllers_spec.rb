require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  let(:recruiter) { create(:recruiter, email: "recruit@example.com", password: "password") }

  describe "POST /auth/login" do
    it "creates an authentication token" do
      post "/auth/login", params: { email: recruiter.email, password: "password" }
      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response).to have_key("token")
      expect(json_response).to have_key("exp")
      expect(json_response).to have_key("username")

      @token = json_response["token"]
    end

    it "fails to create an authentication token" do
      post "/auth/login", params: { email: recruiter.email, password: "wrong_password" }
      expect(response).to have_http_status(:unauthorized)

      json_response = JSON.parse(response.body)
      expect(json_response).to have_key("error")
    end
  end
end