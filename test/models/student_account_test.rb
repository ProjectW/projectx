require 'test_helper'

class StudentTest < ActiveSupport::TestCase
 
  test 'validations' do
    student = StudentAccount.new
    assert_not student.save, 'Saved without full_name, email, and school'
    
    student.full_name = 'Willy Xiao'
    assert_not student.save, 'Saved without email and school'

    student.school = 1
    assert_not student.save, 'Saved without email'

    ['hello@tom', 'bob', '@bob.com'].each do |email| # TODO add .edu requirement into test
      student.email = email
      assert_not student.save, 'Email saved without correct format'
    end
  end

end
