require "test_helper"

class LeasesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get leases_create_url
    assert_response :success
  end

  test "should get destroy" do
    get leases_destroy_url
    assert_response :success
  end
end
