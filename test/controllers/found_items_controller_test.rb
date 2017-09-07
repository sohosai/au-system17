require "test_helper"

class FoundItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @found_item = found_items(:one)
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
      post found_items_url, params: { found_item: { finder_contact: @found_item.finder_contact, finder_name: @found_item.finder_name, item_characteristic: @found_item.item_characteristic, item_kind: @found_item.item_kind, location_found: @found_item.location_found, name: @found_item.name, note: @found_item.note, reception_desk_id: @found_item.reception_desk_id, receptionist_id: @found_item.receptionist_id, resolved_at: @found_item.resolved_at, resolver_id: @found_item.resolver_id } }
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
    patch found_item_url(@found_item), params: { found_item: { finder_contact: @found_item.finder_contact, finder_name: @found_item.finder_name, item_characteristic: @found_item.item_characteristic, item_kind: @found_item.item_kind, location_found: @found_item.location_found, name: @found_item.name, note: @found_item.note, reception_desk_id: @found_item.reception_desk_id, receptionist_id: @found_item.receptionist_id, resolved_at: @found_item.resolved_at, resolver_id: @found_item.resolver_id } }
    assert_redirected_to found_item_url(@found_item)
  end

  test "should destroy found_item" do
    assert_difference("FoundItem.count", -1) do
      delete found_item_url(@found_item)
    end

    assert_redirected_to found_items_url
  end
end
