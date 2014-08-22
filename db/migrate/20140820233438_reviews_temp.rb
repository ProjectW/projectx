class ReviewsTemp < ActiveRecord::Migration
  def self.up
  	create_table :reviews do |t|
  		t.string        :first_name,       :null => false
      t.string        :last_name,        :null => false
      t.string        :email,            :null => false
      t.string        :company,          :null => false
      t.string        :position_title,   :null => false
      t.integer       :net_promoter,     :null => false,        :default => 0
      t.integer       :number_interns,   :null => false,        :default => 0
      t.string        :season,           :null => false,        :default => "Summer"
      t.integer       :year,             :null => false,        :default => 0
      t.integer       :weeks           
      t.float         :start_time,       :null => false,        :default => 0
      t.float         :end_time,         :null => false,        :default => 0
      t.integer       :salary            
      t.integer       :managers        
      t.string        :first_type       
      t.string        :first_difficulty
      t.string        :first_questions
      t.string        :second_type    
      t.string        :second_difficulty
      t.string        :second_questions
      t.string        :third_type  
      t.string        :third_difficulty
      t.string        :third_questions
      t.string        :fourth_type       
      t.string        :fourth_difficulty
      t.string        :fourth_questions
      t.string        :fifth_type  
      t.string        :fifth_difficulty
      t.string        :fifth_questions
      t.string        :rant
      t.integer       :company_rank   
      t.integer       :culture      
      t.integer       :mgmt           
      t.string        :projects
      t.boolean       :offer           
      t.boolean       :return
      t.integer       :recommend       
      t.string        :explain         
      t.timestamps
    end

    add_index "reviews", ["email"], :name => "index_on_email"
  end

  def self.down
    drop_table :reviews
  end
end
