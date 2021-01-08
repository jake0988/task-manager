require 'test_helper'

class GroupTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get group_tasks_new_url
    assert_response :success
  end

end
