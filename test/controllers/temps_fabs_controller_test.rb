require 'test_helper'

class TempsFabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temps_fab = temps_fabs(:one)
  end

  test "should get index" do
    get temps_fabs_url
    assert_response :success
  end

  test "should get new" do
    get new_temps_fab_url
    assert_response :success
  end

  test "should create temps_fab" do
    assert_difference('TempsFab.count') do
      post temps_fabs_url, params: { temps_fab: { tp: @temps_fab.tp, tp_last: @temps_fab.tp_last } }
    end

    assert_redirected_to temps_fab_url(TempsFab.last)
  end

  test "should show temps_fab" do
    get temps_fab_url(@temps_fab)
    assert_response :success
  end

  test "should get edit" do
    get edit_temps_fab_url(@temps_fab)
    assert_response :success
  end

  test "should update temps_fab" do
    patch temps_fab_url(@temps_fab), params: { temps_fab: { tp: @temps_fab.tp, tp_last: @temps_fab.tp_last } }
    assert_redirected_to temps_fab_url(@temps_fab)
  end

  test "should destroy temps_fab" do
    assert_difference('TempsFab.count', -1) do
      delete temps_fab_url(@temps_fab)
    end

    assert_redirected_to temps_fabs_url
  end
end
