require 'test_helper'

class ProjectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projection = projections(:one)
  end

  test "should get index" do
    get projections_url
    assert_response :success
  end

  test "should get new" do
    get new_projection_url
    assert_response :success
  end

  test "should create projection" do
    assert_difference('Projection.count') do
      post projections_url, params: { projection: { obj: @projection.obj, prof_act: @projection.prof_act, proj: @projection.proj } }
    end

    assert_redirected_to projection_url(Projection.last)
  end

  test "should show projection" do
    get projection_url(@projection)
    assert_response :success
  end

  test "should get edit" do
    get edit_projection_url(@projection)
    assert_response :success
  end

  test "should update projection" do
    patch projection_url(@projection), params: { projection: { obj: @projection.obj, prof_act: @projection.prof_act, proj: @projection.proj } }
    assert_redirected_to projection_url(@projection)
  end

  test "should destroy projection" do
    assert_difference('Projection.count', -1) do
      delete projection_url(@projection)
    end

    assert_redirected_to projections_url
  end
end
