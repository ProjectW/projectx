require 'test_helper'

class StudentAccountTest < ActiveSupport::TestCase
 
  test 'validations' do
    student = student_accounts(:willy)

    first_name = student.first_name
    student.first_name = nil
    assert_not student.save, 'Saved without first and last name'
    student.first_name = first_name 

    school_id = student.school_id
    student.school_id = nil
    assert_not student.save, 'Saved without school'
    student.school_id = school_id

    email = student.email
    emails_to_fail = [
      '',
      'hello@tom', 
      'bob', 
      '@bob.com', 
      'willy@chenxiao.us', 
      'wxiao@example.edu', 
      'wxiao@college.harvard.edu.fake',
    ]
    emails_to_fail.each do |email|
      student.email = email
      assert_not student.save, "Email #{email} saved without correct format"
    end

    student.email = email
    assert student.save, 'StudentAccount failed to save correctly'
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

