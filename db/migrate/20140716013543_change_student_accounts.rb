class ChangeStudentAccounts < ActiveRecord::Migration
  def self.up
    change_table :student_accounts do |t|
      t.remove :first_name
      t.remove :last_name
      t.string :full_name,           :null => false
    end

    # remove_index 'student_accounts', :name => 'index_on_last_and_first_name' 
    add_index 'student_accounts', ['full_name'], :name => 'index_on_full_name' 
  end

  def self.down
    change_table :student_accounts do |t|
      t.remove :full_name
      t.string :first_name,         :null => false
      t.string :last_name,          :null => false
    end

    # remove_index 'student_accounts', :name => 'index_on_full_name'
    add_index 'student_accounts', ['last_name', 'first_name'], :name => 'index_on_last_and_first_name' 
  end
end
