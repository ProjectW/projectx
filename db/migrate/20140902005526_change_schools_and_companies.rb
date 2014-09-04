class ChangeSchoolsAndCompanies < ActiveRecord::Migration
  def change
    remove_index :schools, name: 'index_on_name'
    add_index :schools, ['name'], name: 'index_on_name', unique: true

    add_index :companies, ['name'], name: 'index_on_name', unique: true
  end
end
