require "test_helper"

class ReceptionDeskTest < ActiveSupport::TestCase
  def setup
    @reception_desk = ReceptionDesk.create(name: "test", location: "test")
  end

  test "should be valid" do
    assert @reception_desk.valid?
  end

  test "name should be present" do
    @reception_desk.name = "     "
    assert_not @reception_desk.valid?
  end

  test "location should be present" do
    @reception_desk.location = "     "
    assert_not @reception_desk.valid?
  end
end
