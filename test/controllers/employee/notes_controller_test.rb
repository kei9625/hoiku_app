require "test_helper"

class Employee::NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_notes_index_url
    assert_response :success
  end

  test "should get new" do
    get employee_notes_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_notes_edit_url
    assert_response :success
  end

  test "should get show" do
    get employee_notes_show_url
    assert_response :success
  end
end
