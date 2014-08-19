require 'test_helper'

class StudentAccountTest < ActiveSupport::TestCase
 
  test 'validations' do
    student = StudentAccount.new
    assert_not student.save, 'Saved without full_name, email, and school'
    
    student.first_name = 'Willy'
    student.last_name = 'Xiao'
    assert_not student.save, 'Saved without email and school'

    student.school = schools(:harvard)
    assert_not student.save, 'Saved without email'

    ['hello@tom', 'bob', '@bob.com'].each do |email| # TODO add .edu requirement into test
      student.email = email
      assert_not student.save, 'Email saved without correct format'
    end
  end

  test 'set current_resume fail' do
    assert_raises RuntimeError do
      student_accounts(:willy).set_current_resume!(resumes(:karine_resume))
    end
  end

  test 'set current_resume success' do
    assert student_accounts(:willy).set_current_resume!(resumes(:willy_resume)), "Failed to set current_resume"
  end

end

