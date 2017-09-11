require "test_helper"

class LostItemTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "test@example.com", password: "password", name: "test")
    @reception_desks = ReceptionDesk.create(name: "test", location: "test")
    @lost_item = LostItem.new(resolver_id: @user.id,
                              reception_desk_id: @reception_desks.id,
                              receptionist_id: @user.id,
                              location_lost: "test",
                              characteristic: "test characteristic",
                              loser_name: "test finder name",
                              loser_contact: "000-000-000",
                              note: "test note",
                              kind: 0,
                              status: true)
  end

  test "should be valid" do
    assert @lost_item.valid?
  end

  test "reception_desk_id should be present" do
    @lost_item.reception_desk_id = "     "
    assert_not @lost_item.valid?
  end

  test "receptionist_id should be present" do
    @lost_item.receptionist_id = "     "
    assert_not @lost_item.valid?
  end

  test "kind should be present" do
    @lost_item.kind = "     "
    assert_not @lost_item.valid?
  end

  test "status should be present" do
    @lost_item.status = nil
    assert_not @lost_item.valid?
  end

  test "location_found should be present" do
    @lost_item.location_lost = "     "
    assert_not @lost_item.valid?
  end

  test "characteristic should be present" do
    @lost_item.characteristic = "     "
    assert_not @lost_item.valid?
  end
end
