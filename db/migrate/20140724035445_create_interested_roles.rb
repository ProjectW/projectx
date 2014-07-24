class CreateInterestedRoles < ActiveRecord::Migration
  def change
    create_table :interested_roles do |t|
      t.integer :student_attributes_id      :null => false
      t.integer :role # enum for role (e.g. Software Engineer, Marketing)
      t.timestamps
    end
  end
end
