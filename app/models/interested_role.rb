class InterestedRole < ActiveRecord::Base
  belongs_to :student_attribute_list

  enum role: {
    software_engineer: 101,
    mobile_engineer: 102,
    data_scientist: 103,
    ui_designer: 201,
    graphic_designer: 202,
    product_manager: 203,
    sales: 301,
    marketing: 302,
    operations: 303,
    finance: 304,
    business_development: 305,
    consulting: 306
  }
end
