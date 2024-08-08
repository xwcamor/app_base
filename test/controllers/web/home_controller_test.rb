require "test_helper"

class Web::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_home_index_url
    assert_response :success
  end
end
