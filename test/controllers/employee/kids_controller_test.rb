require "test_helper"

class Employee::KidsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_kids_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_kids_edit_url
    assert_response :success
  end
end
