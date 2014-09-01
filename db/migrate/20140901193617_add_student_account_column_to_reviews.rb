class AddStudentAccountColumnToReviews < ActiveRecord::Migration
  def up
    Review.delete_all

    change_table :reviews do |t|
      t.remove :first_name, :last_name, :email, :company

      t.integer :student_account_id, :null => false
      t.integer :company_id # null means orphaned / can't find company
    end

    add_index :reviews, ['company_id', 'student_account_id'], :name => 'index_on_company_id_and_student_account_id'
  end
end
