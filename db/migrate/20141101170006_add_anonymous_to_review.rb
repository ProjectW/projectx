class AddAnonymousToReview < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.boolean 'anonymous', :default => false, :null => false
    end
  end
end
