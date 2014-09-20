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
  { id: 1, name: 'google', display_name: 'Google', url: 'http://www.google.com/about/careers/'},
  { id: 2, name: 'palantir', display_name: 'Palantir', url: 'https://www.palantir.com/college/'},
  { id: 3, name: 'facebook', display_name: 'Facebook', url: 'https://www.facebook.com/careers/university' },
  { id: 4, name: 'harvard_management_company', display_name: 'Harvard Management Company', url:'https://harvardcareers.silkroad.com/' },
  { id: 5, name: 'liveramp', display_name: 'LiveRamp', url: 'http://liveramp.com/careers/' },
  { id: 6, name: 'cueball', display_name: 'Cue Ball', url: 'http://www.cueball.com/' },
  { id: 7, name: 'microsoft', display_name: 'Microsoft', url: 'http://careers.microsoft.com/careers/en/us/collegehome.aspx' },
  { id: 8, name: 'hubspot', display_name: 'HubSpot', url: 'http://www.hubspot.com/jobs' },
  { id: 9, name: 'quora', display_name: 'Quora', url: 'http://www.quora.com/careers'},
  { id: 10, name: 'linkedin', display_name: 'LinkedIn', url: 'http://www.linkedin.com/company/linkedin/careers' },
  { id: 11, name: 'dropbox', display_name: 'Dropbox', url: 'https://www.dropbox.com/jobs' },
  { id: 12, name: 'vivint', display_name: 'vivint', url: 'https://vivintjobs.silkroad.com/' }

]

def seed_database(model, records)
  records.each do |record|
    model_instance = model.send(:where, { :id => record[:id] }).first
    if model_instance.nil?
      model.send(:create, record)
    else
      model_instance.update_attributes(record)
    end
  end
end

seed_database(School, schools)
seed_database(Company, companies)

# schools.each do |school|
#   School.create(school) if School.where(school).empty?
# end

# companies.each do |company|
#   Company.create(company) if Company.where(company).empty?
# end
