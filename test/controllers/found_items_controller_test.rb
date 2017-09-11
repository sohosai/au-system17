require "test_helper"

class FoundItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @found_item = found_items(:one)
    @reception_desk = reception_desks(:one)
    @user = users(:john)
    sign_in(@user)
  end

  test "should get index" do
    get found_items_url
    assert_response :success
  end

  test "should get new" do
    get new_found_item_url
    assert_response :success
  end

  test "should create found_item" do
    assert_difference("FoundItem.count") do
      post found_items_url, params: { found_item: { finder_contact: @found_item.finder_contact,
                                                    finder_name: @found_item.finder_name,
                                                    characteristic: @found_item.characteristic,
                                                    kind: @found_item.kind,
                                                    location_found: @found_item.location_found,
                                                    note: @found_item.note,
                                                    reception_desk_id: @found_item.reception_desk_id,
                                                    receptionist_id: @found_item.receptionist_id,
                                                    status: @found_item.status } }
    end

    assert_redirected_to found_item_url(FoundItem.last)
  end

  test "should show found_item" do
    get found_item_url(@found_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_found_item_url(@found_item)
    assert_response :success
  end

  test "should update found_item" do
    patch found_item_url(@found_item), params: { found_item: { finder_contact: @found_item.finder_contact,
                                                               finder_name: @found_item.finder_name,
                                                               characteristic: @found_item.characteristic,
                                                               kind: @found_item.kind,
                                                               location_found: @found_item.location_found,
                                                               note: @found_item.note,
                                                               reception_desk_id: @found_item.reception_desk_id,
                                                               receptionist_id: @found_item.receptionist_id,
                                                               resolver_id: @found_item.resolver_id } }
    assert_redirected_to found_item_url(@found_item)
  end

  test "should destroy found_item" do
    assert_difference("FoundItem.count", -1) do
      delete found_item_url(@found_item)
    end

    assert_redirected_to found_items_url
  end
end
