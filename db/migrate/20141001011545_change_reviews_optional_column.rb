class ChangeReviewsOptionalColumn < ActiveRecord::Migration
  def change
    change_column_null(:reviews, :number_interns, true)
    change_column_null(:reviews, :projects, true)
    change_column_null(:reviews, :mentorship, true)
    change_column_null(:reviews, :number_hours, true)
    change_column_null(:reviews, :story, true)
    change_column_null(:reviews, :culture, true)
  end
end
