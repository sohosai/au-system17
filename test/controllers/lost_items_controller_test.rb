require "test_helper"

class LostItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lost_item = lost_items(:one)
  end

  test "should get index" do
    get lost_items_url
    assert_response :success
  end

  test "should get new" do
    get new_lost_item_url
    assert_response :success
  end

  test "should create lost_item" do
    assert_difference("LostItem.count") do
      post lost_items_url, params: { lost_item: { characteristic: @lost_item.characteristic, kind: @lost_item.kind, location_lost: @lost_item.location_lost, loser_name: @lost_item.loser_name, loser_name: @lost_item.loser_name, name: @lost_item.name, note: @lost_item.note, reception_desk_id: @lost_item.reception_desk_id, receptionist_id: @lost_item.receptionist_id, resolved_at: @lost_item.resolved_at, resolver_id: @lost_item.resolver_id } }
    end

    assert_redirected_to lost_item_url(LostItem.last)
  end

  test "should show lost_item" do
    get lost_item_url(@lost_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_lost_item_url(@lost_item)
    assert_response :success
  end

  test "should update lost_item" do
    patch lost_item_url(@lost_item), params: { lost_item: { characteristic: @lost_item.characteristic, kind: @lost_item.kind, location_lost: @lost_item.location_lost, loser_name: @lost_item.loser_name, loser_name: @lost_item.loser_name, name: @lost_item.name, note: @lost_item.note, reception_desk_id: @lost_item.reception_desk_id, receptionist_id: @lost_item.receptionist_id, resolved_at: @lost_item.resolved_at, resolver_id: @lost_item.resolver_id } }
    assert_redirected_to lost_item_url(@lost_item)
  end

  test "should destroy lost_item" do
    assert_difference("LostItem.count", -1) do
      delete lost_item_url(@lost_item)
    end

    assert_redirected_to lost_items_url
  end
end
