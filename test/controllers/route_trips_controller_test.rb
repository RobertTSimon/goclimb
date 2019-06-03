require 'test_helper'

class RouteTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get route_trips_destroy_url
    assert_response :success
  end

end
