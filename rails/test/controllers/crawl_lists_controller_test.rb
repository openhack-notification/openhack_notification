require 'test_helper'

class CrawlListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crawl_list = crawl_lists(:one)
  end

  test "should get index" do
    get crawl_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_crawl_list_url
    assert_response :success
  end

  test "should create crawl_list" do
    assert_difference('CrawlList.count') do
      post crawl_lists_url, params: { crawl_list: { is_message_send: @crawl_list.is_message_send, title: @crawl_list.title } }
    end

    assert_redirected_to crawl_list_url(CrawlList.last)
  end

  test "should show crawl_list" do
    get crawl_list_url(@crawl_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_crawl_list_url(@crawl_list)
    assert_response :success
  end

  test "should update crawl_list" do
    patch crawl_list_url(@crawl_list), params: { crawl_list: { is_message_send: @crawl_list.is_message_send, title: @crawl_list.title } }
    assert_redirected_to crawl_list_url(@crawl_list)
  end

  test "should destroy crawl_list" do
    assert_difference('CrawlList.count', -1) do
      delete crawl_list_url(@crawl_list)
    end

    assert_redirected_to crawl_lists_url
  end
end
