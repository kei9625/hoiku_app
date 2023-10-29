require "test_helper"

class Parent::KidsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parent_kids_new_url
    assert_response :success
  end

  test "should get edit" do
    get parent_kids_edit_url
    assert_response :success
  end
end
