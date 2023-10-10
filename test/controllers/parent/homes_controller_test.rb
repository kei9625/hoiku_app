require "test_helper"

class Parent::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_homes_index_url
    assert_response :success
  end
end
