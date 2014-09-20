class ChangeReviews2 < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.remove :net_promoter, :season, :hours, :end

      t.integer :city_id,      :null => false
      t.integer :season,       :null => false
      t.integer :number_hours, :null => false

      t.boolean :recommend,    :null => false

      t.text :story,           :null => false
      t.text :culture,         :null => false

      t.text :extra
    end

    add_index "reviews", ["city_id"], :name => "index_on_city_id"
  end
end
