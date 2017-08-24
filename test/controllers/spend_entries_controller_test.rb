require 'test_helper'

class SpendEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spend_entry = spend_entries(:one)
  end

  test "should get index" do
    get spend_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_spend_entry_url
    assert_response :success
  end

  test "should create spend_entry" do
    assert_difference('SpendEntry.count') do
      post spend_entries_url, params: { spend_entry: { amount: @spend_entry.amount } }
    end

    assert_redirected_to spend_entry_url(SpendEntry.last)
  end

  test "should show spend_entry" do
    get spend_entry_url(@spend_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_spend_entry_url(@spend_entry)
    assert_response :success
  end

  test "should update spend_entry" do
    patch spend_entry_url(@spend_entry), params: { spend_entry: { amount: @spend_entry.amount } }
    assert_redirected_to spend_entry_url(@spend_entry)
  end

  test "should destroy spend_entry" do
    assert_difference('SpendEntry.count', -1) do
      delete spend_entry_url(@spend_entry)
    end

    assert_redirected_to spend_entries_url
  end
end
