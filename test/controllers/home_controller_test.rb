require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get cv" do
    get home_cv_url
    assert_response :success
  end
end
