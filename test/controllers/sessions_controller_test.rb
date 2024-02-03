require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: {username: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    assert_response :created
  
    data = JSON.parse(response.body)
    assert data.keys.sort == ["email", "jwt", "user_id", "username"].sort
  end
end
