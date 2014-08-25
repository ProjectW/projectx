class ChangeReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.remove :weeks, :start_time, :end_time, :managers, :rant, :company_rank, :culture, :mgmt, :offer, :return, :recommend, :explain, :first_type, :first_difficulty, :first_questions, :second_type, :second_difficulty, :second_questions, :third_type, :third_difficulty, :third_questions, :fourth_type, :fourth_difficulty, :fourth_questions, :fifth_type, :fifth_difficulty, :fifth_questions
      t.string :hours,        :null => false
      t.string :mentorship,   :null => false
      t.string :end,          :null => false
    end
  end
end
