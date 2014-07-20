class AddFileToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.remove :file_name
    end
    
    add_attachment :resumes, :upload
  end

  def self.down
    change_table :resumes do |t|
      t.string :file_name,      :null => false
    end

    remove_attachment :resumes, :upload
  end
end
