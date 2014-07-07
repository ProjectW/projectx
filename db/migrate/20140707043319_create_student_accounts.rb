class CreateStudentAccounts < ActiveRecord::Migration
  def self.up
    create_table :student_accounts do |t|
      t.string        :first_name,            :null => false
      t.string        :last_name,             :null => false
      t.string        :middle_name               
      t.string        :email,                 :null => false
      t.boolean       :verified,              :null => false,       :default => false
      t.integer       :school,                :null => false
      t.integer       :graduation_year     
      t.integer       :current_resume_id  # will need a foreign key on this            
      t.timestamps
    end

    add_index "student_accounts", ["last_name", "first_name"], :name => "index_on_last_and_first_name"
    add_index "student_accounts", ["email"], :name => "index_on_email"
    add_index "student_accounts", ["school"], :name => "index_on_school"
  end

  def self.down
    drop_table :student_accounts
  end
end
