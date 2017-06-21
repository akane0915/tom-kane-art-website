require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get details_index_url
    assert_response :success
  end

end
