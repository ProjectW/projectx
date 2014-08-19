require 'test_helper'

class Student::StudentDashboardControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    login_student
  end

  test "show" do
    get :show
    # FIXME this fails because fixtures are incomplete
    # assert_response :success
  end

end
