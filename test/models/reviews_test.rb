require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
 
  test 'validations' do
    review = Review.new
    assert_not review.save, "Review saved without any attributes set"
  end
end

