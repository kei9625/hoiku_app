require "test_helper"

class Employee::ParentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employee_parents_show_url
    assert_response :success
  end

  test "should get edit" do
    get employee_parents_edit_url
    assert_response :success
  end
end
