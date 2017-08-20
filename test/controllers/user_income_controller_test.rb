require 'test_helper'

class UserIncomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_income_index_url
    assert_response :success
  end

  test "should get create" do
    get user_income_create_url
    assert_response :success
  end

  test "should get new" do
    get user_income_new_url
    assert_response :success
  end

  test "should get destroy" do
    get user_income_destroy_url
    assert_response :success
  end

  test "should get show" do
    get user_income_show_url
    assert_response :success
  end

end
