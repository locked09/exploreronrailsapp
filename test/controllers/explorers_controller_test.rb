require "test_helper"

class ExplorersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @explorer = explorers(:one)
  end

  test "should get index" do
    get explorers_url
    assert_response :success
  end

  test "should get new" do
    get new_explorer_url
    assert_response :success
  end

  test "should create explorer" do
    assert_difference('Explorer.count') do
      post explorers_url, params: { explorer: { email: @explorer.email, first_name: @explorer.first_name, last_name: @explorer.last_name, phone: @explorer.phone, twitter: @explorer.twitter } }
    end

    assert_redirected_to explorer_url(Explorer.last)
  end

  test "should show explorer" do
    get explorer_url(@explorer)
    assert_response :success
  end

  test "should get edit" do
    get edit_explorer_url(@explorer)
    assert_response :success
  end

  test "should update explorer" do
    patch explorer_url(@explorer), params: { explorer: { email: @explorer.email, first_name: @explorer.first_name, last_name: @explorer.last_name, phone: @explorer.phone, twitter: @explorer.twitter } }
    assert_redirected_to explorer_url(@explorer)
  end

  test "should destroy explorer" do
    assert_difference('Explorer.count', -1) do
      delete explorer_url(@explorer)
    end

    assert_redirected_to explorers_url
  end
end
