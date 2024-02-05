require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create!(username: "Test", email: "test@test.com", password: "password", password_confirmation: "password", profile_visibility: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end
  
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { username: "TestUser", email: "testuser@test.com", password: "password", password_confirmation: "password", profile_visibility: true }
      assert_response 201
    end
  end

  test "update" do
    patch "/users/#{@user.id}.json", params: { username: "Updated username" }, headers: { Authorization: "Bearer #{@jwt}"}
    assert_response 200
    

    data = JSON.parse(response.body)
    assert_equal "User updated successfully", data["message"]
  end

end
