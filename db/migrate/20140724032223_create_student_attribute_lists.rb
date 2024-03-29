class CreateStudentAttributeLists < ActiveRecord::Migration
  def self.up
    create_table :student_attribute_lists do |t|
      t.integer :student_account_id,        :null => false
      t.string  :github_url
      t.string  :website_url
      t.integer :technical_level
      t.integer :major
      t.timestamps
    end
  end

  def self.down
    drop_table :student_attribute_lists
  end

end
