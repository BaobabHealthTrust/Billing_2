require 'test_helper'

class InsuranceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get insurance_index_url
    assert_response :success
  end

end
