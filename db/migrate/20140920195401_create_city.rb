class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string  :name,  :null => false

      t.string :state,  :limit => 2
      t.integer :country_id,  :null => false

      t.float :latitude
      t.float :longitude
    end

    add_index "cities", ["state"], :name => "index_on_state"
    add_index "cities", ["country_id"], :name => "index_on_country_id"
  end
end
