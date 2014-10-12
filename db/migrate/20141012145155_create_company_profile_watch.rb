class CreateCompanyProfileWatch < ActiveRecord::Migration
  def change
    create_table :company_profile_watches do |t|
      t.integer :company_id, :null => false
      t.integer :student_account_id, :null => false
      t.boolean :watching, :default => true, :null => false
      t.timestamps
    end

    add_index "company_profile_watches", ["company_id", "student_account_id"], :name => "index_on_company_student_account_id", :unique => true
    add_index "company_profile_watches", ["watching"], :name => "index_on_watching"
  end
end
