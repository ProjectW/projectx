class InterestedRole < ActiveRecord::Base
  belongs_to :student_attribute_list

  enumerate :role do
    value :name => 'software_engineer',     :id => 101
    value :name => 'mobile_engineer',       :id => 102
    value :name => 'data_scientist',        :id => 103
    value :name => 'ui_designer',           :id => 201
    value :name => 'graphic_designer',      :id => 202
    value :name => 'product_manager',       :id => 203
    value :name => 'sales',                 :id => 301
    value :name => 'marketing',             :id => 302
    value :name => 'operations',            :id => 303
    value :name => 'finance',               :id => 304
    value :name => 'business_development',  :id => 305
    value :name => 'consulting',            :id => 306
  end
end
