require "test_helper"

class ReceptionDesksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @reception_desk = reception_desks(:one)
    @user = users(:john)
    sign_in(@user)
  end

  test "should get index" do
    get reception_desks_url
    assert_response :success
  end

  test "should get new" do
    get new_reception_desk_url
    assert_response :success
  end

  test "should create reception_desk" do
    assert_difference("ReceptionDesk.count") do
      post reception_desks_url, params: { reception_desk: { location: @reception_desk.location, name: @reception_desk.name } }
    end

    assert_redirected_to reception_desk_url(ReceptionDesk.last)
  end

  test "should show reception_desk" do
    get reception_desk_url(@reception_desk)
    assert_response :success
  end

  test "should get edit" do
    get edit_reception_desk_url(@reception_desk)
    assert_response :success
  end

  test "should update reception_desk" do
    patch reception_desk_url(@reception_desk), params: { reception_desk: { location: @reception_desk.location, name: @reception_desk.name } }
    assert_redirected_to reception_desk_url(@reception_desk)
  end

  test "should destroy reception_desk" do
    assert_difference("ReceptionDesk.count", -1) do
      delete reception_desk_url(@reception_desk)
    end

    assert_redirected_to reception_desks_url
  end
end
