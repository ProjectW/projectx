class AddColumnsToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.string 'url'
    end
  end
end
