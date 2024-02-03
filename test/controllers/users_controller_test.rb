require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { username: "Test", email: "test@test.com", password_digest: "password", profile_visibility: true }
      assert_response 201
    end
  end

  test "update" do
    user = User.first
    patch "/users/#{user.id}.json", params: { username: "Updated username" }
    assert_response 200
    

    data = JSON.parse(response.body)
    assert_equal "User updated successfully", data["message"]
  end

end
