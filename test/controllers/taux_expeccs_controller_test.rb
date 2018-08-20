require 'test_helper'

class TauxExpeccsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taux_expecc = taux_expeccs(:one)
  end

  test "should get index" do
    get taux_expeccs_url
    assert_response :success
  end

  test "should get new" do
    get new_taux_expecc_url
    assert_response :success
  end

  test "should create taux_expecc" do
    assert_difference('TauxExpecc.count') do
      post taux_expeccs_url, params: { taux_expecc: { cmd: @taux_expecc.cmd, obj: @taux_expecc.obj, total: @taux_expecc.total } }
    end

    assert_redirected_to taux_expecc_url(TauxExpecc.last)
  end

  test "should show taux_expecc" do
    get taux_expecc_url(@taux_expecc)
    assert_response :success
  end

  test "should get edit" do
    get edit_taux_expecc_url(@taux_expecc)
    assert_response :success
  end

  test "should update taux_expecc" do
    patch taux_expecc_url(@taux_expecc), params: { taux_expecc: { cmd: @taux_expecc.cmd, obj: @taux_expecc.obj, total: @taux_expecc.total } }
    assert_redirected_to taux_expecc_url(@taux_expecc)
  end

  test "should destroy taux_expecc" do
    assert_difference('TauxExpecc.count', -1) do
      delete taux_expecc_url(@taux_expecc)
    end

    assert_redirected_to taux_expeccs_url
  end
end
