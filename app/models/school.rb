class School < ActiveRecord::Base
  has_many :students

  enum degree_level: {
    bachelors: 1,
    masters: 2,
    phd: 3
  }
end
