require "test_helper"

class Employee::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_homes_new_url
    assert_response :success
  end
end
