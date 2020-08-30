require 'test_helper'

class Public::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliveries_index_url
    assert_response :success
  end

end
