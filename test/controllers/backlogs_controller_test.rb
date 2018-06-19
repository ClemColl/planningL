require 'test_helper'

class BacklogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backlog = backlogs(:one)
  end

  test "should get index" do
    get backlogs_url
    assert_response :success
  end

  test "should get new" do
    get new_backlog_url
    assert_response :success
  end

  test "should create backlog" do
    assert_difference('Backlog.count') do
      post backlogs_url, params: { backlog: { mac: @backlog.mac, mb: @backlog.mb, mfc: @backlog.mfc, ob: @backlog.ob, quart: @backlog.quart, week: @backlog.week } }
    end

    assert_redirected_to backlog_url(Backlog.last)
  end

  test "should show backlog" do
    get backlog_url(@backlog)
    assert_response :success
  end

  test "should get edit" do
    get edit_backlog_url(@backlog)
    assert_response :success
  end

  test "should update backlog" do
    patch backlog_url(@backlog), params: { backlog: { mac: @backlog.mac, mb: @backlog.mb, mfc: @backlog.mfc, ob: @backlog.ob, quart: @backlog.quart, week: @backlog.week } }
    assert_redirected_to backlog_url(@backlog)
  end

  test "should destroy backlog" do
    assert_difference('Backlog.count', -1) do
      delete backlog_url(@backlog)
    end

    assert_redirected_to backlogs_url
  end
end
