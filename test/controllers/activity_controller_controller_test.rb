require 'test_helper'

class ActivityControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get activity_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get activity_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get activity_controller_update_url
    assert_response :success
  end

  test "should get edit" do
    get activity_controller_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get activity_controller_destroy_url
    assert_response :success
  end

  test "should get index" do
    get activity_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get activity_controller_show_url
    assert_response :success
  end

end
