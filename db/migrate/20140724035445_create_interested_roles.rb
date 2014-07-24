class CreateInterestedRoles < ActiveRecord::Migration
  def change
    create_table :interested_roles do |t|
      t.integer :student_attributes_id,      :null => false
      t.integer :role # enum for role (e.g. Software Engineer, Marketing)
      t.timestamps
    end

    add_index 'interested_roles', ['student_attributes_id'], :name => 'index_on_student_attributes_id'
    add_index 'interested_roles', ['role'], :name => 'index_on_role'
  end
end
