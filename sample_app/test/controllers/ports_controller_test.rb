require 'test_helper'

class PortsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ports_new_url
    assert_response :success
  end

end
