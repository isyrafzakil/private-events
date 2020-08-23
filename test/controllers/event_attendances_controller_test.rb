require 'test_helper'

class EventAttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_attendances_index_url
    assert_response :success
  end

  test "should get show" do
    get event_attendances_show_url
    assert_response :success
  end

end
