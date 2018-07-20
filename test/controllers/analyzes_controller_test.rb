require 'test_helper'

class AnalyzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analyze = analyzes(:one)
  end

  test "should get index" do
    get analyzes_url
    assert_response :success
  end

  test "should get new" do
    get new_analyze_url
    assert_response :success
  end

  test "should create analyze" do
    assert_difference('Analyze.count') do
      post analyzes_url, params: { analyze: {  } }
    end

    assert_redirected_to analyze_url(Analyze.last)
  end

  test "should show analyze" do
    get analyze_url(@analyze)
    assert_response :success
  end

  test "should get edit" do
    get edit_analyze_url(@analyze)
    assert_response :success
  end

  test "should update analyze" do
    patch analyze_url(@analyze), params: { analyze: {  } }
    assert_redirected_to analyze_url(@analyze)
  end

  test "should destroy analyze" do
    assert_difference('Analyze.count', -1) do
      delete analyze_url(@analyze)
    end

    assert_redirected_to analyzes_url
  end
end
