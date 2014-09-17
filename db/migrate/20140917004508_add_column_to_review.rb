class AddColumnToReview < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.boolean 'contactable', :default => false, :null => false
    end
  end
end
