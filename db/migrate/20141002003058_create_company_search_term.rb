class CreateCompanySearchTerm < ActiveRecord::Migration
  def change
    create_table :company_search_terms do |t|
      t.integer :student_account_id,  :null => false
      t.string :term, :null => false
      t.timestamps
    end
  end
end
