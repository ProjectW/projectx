class AddDeviseColumnsToStudentAccount < ActiveRecord::Migration
  def change
    change_table :student_accounts do |t|
      t.remove :email, :verified
      
      ## Database authenticatable
      t.string :email,              :null => false, :default => ''
      t.string :encrypted_password, :null => false, :default => ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end

    remove_index :student_accounts, :name => 'index_on_school_and_email'
    add_index :student_accounts, ['school', 'email'], :name => 'index_on_school_and_email'
  end
end
