require "test_helper"

class BuddyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buddy_index_url
    assert_response :success
  end
end
