class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string    :name              :null => false,   :default => ''
      t.string    :display_name      :null => false,   :default => ''
      t.integer   :degree_level  # undergrad / grad etc.,
      t.timestamps
    end

    add_index 'school', ['name'], :name => 'index_on_name'
  end
end
