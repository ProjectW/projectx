class CreateCompanyProfileWatches < ActiveRecord::Migration
  def self.up
    create_table :company_profile_watches do |t|
      t.integer :company_id,  :null => false
      t.integer :student_account_id,  :null => false
      t.boolean :watching,  :default => true, :null => false
      t.timestamps
    end
  end
end
