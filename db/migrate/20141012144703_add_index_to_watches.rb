class AddIndexToWatches < ActiveRecord::Migration
  def self.up
    add_index "company_profile_watches", ["company_id", "student_account_id"], :name => "index_on_company_student_account_id"
    add_index "company_profile_watches", ["watching"], :name => "index_on_watching"
  end
end
