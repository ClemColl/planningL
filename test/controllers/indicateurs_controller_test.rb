require 'test_helper'

class IndicateursControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get indicateurs_all_url
    assert_response :success
  end

  test "should get production" do
    get indicateurs_production_url
    assert_response :success
  end

  test "should get suivi" do
    get indicateurs_suivi_url
    assert_response :success
  end

end
