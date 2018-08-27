require 'test_helper'

class SuiviInficsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suivi_infic = suivi_infics(:one)
  end

  test "should get index" do
    get suivi_infics_url
    assert_response :success
  end

  test "should get new" do
    get new_suivi_infic_url
    assert_response :success
  end

  test "should create suivi_infic" do
    assert_difference('SuiviInfic.count') do
      post suivi_infics_url, params: { suivi_infic: { obj_l: @suivi_infic.obj_l, obj_p: @suivi_infic.obj_p, slc: @suivi_infic.slc, sls: @suivi_infic.sls, spc: @suivi_infic.spc, sps: @suivi_infic.sps } }
    end

    assert_redirected_to suivi_infic_url(SuiviInfic.last)
  end

  test "should show suivi_infic" do
    get suivi_infic_url(@suivi_infic)
    assert_response :success
  end

  test "should get edit" do
    get edit_suivi_infic_url(@suivi_infic)
    assert_response :success
  end

  test "should update suivi_infic" do
    patch suivi_infic_url(@suivi_infic), params: { suivi_infic: { obj_l: @suivi_infic.obj_l, obj_p: @suivi_infic.obj_p, slc: @suivi_infic.slc, sls: @suivi_infic.sls, spc: @suivi_infic.spc, sps: @suivi_infic.sps } }
    assert_redirected_to suivi_infic_url(@suivi_infic)
  end

  test "should destroy suivi_infic" do
    assert_difference('SuiviInfic.count', -1) do
      delete suivi_infic_url(@suivi_infic)
    end

    assert_redirected_to suivi_infics_url
  end
end
