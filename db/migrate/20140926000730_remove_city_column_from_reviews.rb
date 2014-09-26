class RemoveCityColumnFromReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.remove :city_id
      t.string :location
    end
  end
end
