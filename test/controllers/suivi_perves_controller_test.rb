require 'test_helper'

class SuiviPervesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suivi_perf = suivi_perves(:one)
  end

  test "should get index" do
    get suivi_perves_url
    assert_response :success
  end

  test "should get new" do
    get new_suivi_perf_url
    assert_response :success
  end

  test "should create suivi_perf" do
    assert_difference('SuiviPerf.count') do
      post suivi_perves_url, params: { suivi_perf: { bcs: @suivi_perf.bcs, bct: @suivi_perf.bct, obj: @suivi_perf.obj } }
    end

    assert_redirected_to suivi_perf_url(SuiviPerf.last)
  end

  test "should show suivi_perf" do
    get suivi_perf_url(@suivi_perf)
    assert_response :success
  end

  test "should get edit" do
    get edit_suivi_perf_url(@suivi_perf)
    assert_response :success
  end

  test "should update suivi_perf" do
    patch suivi_perf_url(@suivi_perf), params: { suivi_perf: { bcs: @suivi_perf.bcs, bct: @suivi_perf.bct, obj: @suivi_perf.obj } }
    assert_redirected_to suivi_perf_url(@suivi_perf)
  end

  test "should destroy suivi_perf" do
    assert_difference('SuiviPerf.count', -1) do
      delete suivi_perf_url(@suivi_perf)
    end

    assert_redirected_to suivi_perves_url
  end
end
