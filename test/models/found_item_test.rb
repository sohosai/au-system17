require 'test_helper'

class FoundItemTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'test@example.com', password: 'password', name: 'test')
    @reception_desks = ReceptionDesk.create(name: 'test', location: 'test')
    @found_item = FoundItem.new(resolver_id: @user.id,
                                reception_desk_id: @reception_desks.id,
                                receptionist_id: @user.id,
                                name: 'test',
                                location_found: 'test',
                                characteristic: 'test characteristic',
                                finder_name: 'test finder name',
                                finder_contact: '000-000-000',
                                note: 'test note',
                                kind: 0,
                                status: true)
  end
  test 'should be valid' do
    assert @found_item.valid?
  end
end
