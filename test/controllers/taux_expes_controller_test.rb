require 'test_helper'

class TauxExpesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taux_expe = taux_expes(:one)
  end

  test "should get index" do
    get taux_expes_url
    assert_response :success
  end

  test "should get new" do
    get new_taux_expe_url
    assert_response :success
  end

  test "should create taux_expe" do
    assert_difference('TauxExpe.count') do
      post taux_expes_url, params: { taux_expe: { obj: @taux_expe.obj, taux: @taux_expe.taux } }
    end

    assert_redirected_to taux_expe_url(TauxExpe.last)
  end

  test "should show taux_expe" do
    get taux_expe_url(@taux_expe)
    assert_response :success
  end

  test "should get edit" do
    get edit_taux_expe_url(@taux_expe)
    assert_response :success
  end

  test "should update taux_expe" do
    patch taux_expe_url(@taux_expe), params: { taux_expe: { obj: @taux_expe.obj, taux: @taux_expe.taux } }
    assert_redirected_to taux_expe_url(@taux_expe)
  end

  test "should destroy taux_expe" do
    assert_difference('TauxExpe.count', -1) do
      delete taux_expe_url(@taux_expe)
    end

    assert_redirected_to taux_expes_url
  end
end
