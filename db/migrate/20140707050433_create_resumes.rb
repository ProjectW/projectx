class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
      t.integer :student_account_id,    :null => false
      t.string :file_name,              :null => false
      t.boolean :deleted,               :null => false,       :default => false
      t.timestamps
    end

    add_index 'resumes', ['student_account_id'], :name => 'index_on_student_account_id'
  end
  def self.down
    drop_table :resumes
  end
end
