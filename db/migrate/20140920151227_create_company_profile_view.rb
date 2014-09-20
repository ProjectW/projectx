class CreateCompanyProfileView < ActiveRecord::Migration
  def self.up
    create_table :company_profile_views do |t|
      t.integer :company_id,          :null => false
      t.integer :student_account_id,  :null => false
      t.timestamps
    end

    add_index "company_profile_views", ["company_id", "student_account_id"], :name => "index_on_company_student_account_id"
  end

  def self.down
    drop_table :company_profile_views
  end
end
