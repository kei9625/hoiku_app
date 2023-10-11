require "test_helper"

class Employee::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employee_mypage_show_url
    assert_response :success
  end

  test "should get edit" do
    get employee_mypage_edit_url
    assert_response :success
  end
end
