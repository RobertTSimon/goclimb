require 'test_helper'

class WallsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get walls_show_url
    assert_response :success
  end

end
