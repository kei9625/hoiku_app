require "test_helper"

class Parent::NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_notes_index_url
    assert_response :success
  end

  test "should get show" do
    get parent_notes_show_url
    assert_response :success
  end

  test "should get new" do
    get parent_notes_new_url
    assert_response :success
  end
end
