require 'test_helper'

class GroupUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get group_users_show_url
    assert_response :success
  end

  test "should get index" do
    get group_users_index_url
    assert_response :success
  end

end
