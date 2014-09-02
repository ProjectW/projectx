# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

schools = [
  { id: 1, name: 'harvard_college', display_name: 'Harvard', degree_level: 1 }
]

companies = [
  { id: 1, name: 'google', display_name: 'Google' },
  { id: 2, name: 'palantir', display_name: 'Palantir' },
  { id: 3, name: 'facebook', display_name: 'Facebook' },
  { id: 4, name: 'harvard_management_company', display_name: 'Harvard Management Company' },
  { id: 5, name: 'liveramp', display_name: 'LiveRamp' },
  { id: 6, name: 'cueball', display_name: 'CueBall' }
]

schools.each do |school|
  School.create(school) if School.where(school).empty?
end

companies.each do |company|
  Company.create(company) if Company.where(company).empty?
end
