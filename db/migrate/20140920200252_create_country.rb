class CreateCountry < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name,   :null => false
      t.string :maxmind_code, :limit => 2
    end
  end
end
