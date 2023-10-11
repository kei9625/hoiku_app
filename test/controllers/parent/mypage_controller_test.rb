require "test_helper"

class Parent::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get parent_mypage_show_url
    assert_response :success
  end

  test "should get edit" do
    get parent_mypage_edit_url
    assert_response :success
  end
end
