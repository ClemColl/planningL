require 'test_helper'

class RapportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rapport = rapports(:one)
  end

  test "should get index" do
    get rapports_url
    assert_response :success
  end

  test "should get new" do
    get new_rapport_url
    assert_response :success
  end

  test "should create rapport" do
    assert_difference('Rapport.count') do
      post rapports_url, params: { rapport: { cas: @rapport.cas, cta: @rapport.cta, dav: @rapport.dav, dsa: @rapport.dsa, machine_id: @rapport.machine_id, pdp: @rapport.pdp } }
    end

    assert_redirected_to rapport_url(Rapport.last)
  end

  test "should show rapport" do
    get rapport_url(@rapport)
    assert_response :success
  end

  test "should get edit" do
    get edit_rapport_url(@rapport)
    assert_response :success
  end

  test "should update rapport" do
    patch rapport_url(@rapport), params: { rapport: { cas: @rapport.cas, cta: @rapport.cta, dav: @rapport.dav, dsa: @rapport.dsa, machine_id: @rapport.machine_id, pdp: @rapport.pdp } }
    assert_redirected_to rapport_url(@rapport)
  end

  test "should destroy rapport" do
    assert_difference('Rapport.count', -1) do
      delete rapport_url(@rapport)
    end

    assert_redirected_to rapports_url
  end
end
