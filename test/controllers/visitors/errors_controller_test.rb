require "test_helper"

class Visitors::ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get visitors_errors_not_found_url
    assert_response :success
  end

  test "should get internal_server_error" do
    get visitors_errors_internal_server_error_url
    assert_response :success
  end
end
