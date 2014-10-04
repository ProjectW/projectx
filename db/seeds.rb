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
  { id: 12, name: 'vivint', display_name: 'Vivint', url: 'https://vivintjobs.silkroad.com/' }, 
  { id: 13, name: 'bridgewater_associates', display_name: 'Bridgewater Associates', url: 'http://www.bwater.com/home/careers.aspx' },
  { id: 14, name: 'bain', display_name: 'Bain & Company', url: 'http://www.joinbain.com/'},
  { id: 15, name: 'mckinsey', display_name: 'McKinsey & Company', url: 'http://www.mckinsey.com/careers.aspx' },
  { id: 16, name: 'kensho', display_name: 'Kensho', url: 'https://kensho.recruiterbox.com/' },
  { id: 17, name: 'square', display_name: 'Square', url: 'http://hire.jobvite.com/CompanyJobs/Careers.aspx?c=q8Z9VfwV' },
  { id: 18, name: 'paypal', display_name: 'Paypal', url: 'http://www.ebaycareers.com/home.aspx' },
  { id: 19, name: 'Amazon', display_name: 'Amazon', url: 'http://www.amazon.jobs/team/university-internships#jobresults' }, 
  { id: 20, name: 'A9', display_name: 'A9', url: 'https://a9.com/careers/' },
  { id: 21, name: 'asana', display_name: 'Asana', url: 'https://asana.com/jobs'},
  { id: 22, name: 'twitter', display_name: 'Twitter', url: 'https://about.twitter.com/careers/teams/university' },
  { id: 23, name: 'handy', display_name: 'Handy', url: 'http://www.handybook.com/careers' },
  { id: 24, name: 'pinterest', display_name: 'Pinterest', url: 'https://about.pinterest.com/en/careers' },
  { id: 25, name: 'jane_street', display_name: 'Jane Street', url: 'http://www.amazon.jobs/team/university-internships#jobresults' }, 
  { id: 26, name: 'fidelity_investments', display_name: 'Fidelity Investments', url: 'http://jobs.fidelity.com/students/undergraduate.html' },
  { id: 27, name: 'morgan_stanley', display_name: 'Morgan Stanley', url: 'http://www.morganstanley.com/about/careers/internships.html'},
  { id: 28, name: 'blackrock', display_name: 'BlackRock', url: 'http://www.blackrock.com/corporate/en-us/careers' },
  { id: 29, name: 'blackstone', display_name: 'Blackstone', url: 'http://www.blackstone.com/careers/campus-recruiting/summer-internships' },
  { id: 30, name: 'bessemer', display_name: 'Bessemer Venture Partners', url: 'http://jobs.bvp.com/' },
  { id: 31, name: 'jpmorgan', display_name: 'J.P.Morgan', url: 'http://careers.jpmorgan.com/student/jpmorgan/careers' },
  { id: 32, name: 'shmoop', display_name: 'Shmoop', url: 'http://www.shmoop.com/public/jobs/'},
  { id: 33, name: 'goldman', display_name: 'Goldman Sachs', url: 'http://www.goldmansachs.com/careers/students-and-graduates/' },
  { id: 34, name: 'stripe', display_name: 'Stripe', url: 'https://stripe.com/jobs/' },
  { id: 35, name: 'five_stars', display_name: 'Five Stars', url: 'http://www.fivestars.com/team/careers/' },
  { id: 36, name: 'yahoo', display_name: 'Yahoo', url: 'https://careers.yahoo.com/us/students' },
  { id: 37, name: '3red', display_name: '3Red', url: 'http://www.3redgroup.com/campus/'},
  { id: 38, name: 'slack', display_name: 'Slack', url: 'https://slack.com/jobs' },
  { id: 39, name: 'nextdoor', display_name: 'Nextdoor', url: 'https://nextdoor.com/jobs/' },
  { id: 40, name: 'evernote', display_name: 'Evernote', url: 'https://evernote.com/careers/?utm_source=twitter' },
  { id: 41, name: 'putnam', display_name: 'Putnam Investments', url: 'https://www.putnam.com/careers/' },
  { id: 42, name: 'salesforce', display_name: 'Salesforce', url: 'http://www.salesforce.com/company/careers/futureforce/' },
  { id: 43, name: 'jawbone', display_name: 'Jawbone', url: 'https://jawbone.com/careers' },
  { id: 44, name: 'fitbit', display_name: 'Fitbit', url: 'http://www.fitbit.com/jobs' },
  { id: 45, name: '76', display_name: 'Philadelphia 76ers', url: 'http://www.nba.com/careers/' },
  { id: 46, name: 'two_sigma', display_name: 'Two Sigma Investments', url: 'http://www.twosigma.com/careers.html'},
  { id: 47, name: 'floored', display_name: 'Floored', url: 'http://floored.com/jobs/'},
  { id: 48, name: 'apple', display_name: 'Apple', url: 'https://www.apple.com/jobs/us/students.html#internship_undergraduate'},
  { id: 49, name: 'lek', display_name: 'LEK Consulting', url: 'http://www.lek.com/join-lek/career-paths/undergraduate' },
  { id: 50, name: 'novantas', display_name: 'Novantas', url: 'http://novantas.com/careers/'},
  { id: 51, name: 'athenahealth', display_name: 'athenahealth', url: 'http://www.athenahealth.com/careers/'},
  { id: 52, name: 'bcg', display_name: 'BCG', url: 'http://careers.bcg.com/path/internships.aspx'},
  { id: 53, name: 'localytics', display_name: 'localytics', url: 'http://www.localytics.com/company/localytics-jobs/'},
  { id: 54, name: 'wearhaus', display_name: 'Wearhaus', url: 'http://jobs.wearhaus.com/'},
  { id: 55, name: 'capital_group', display_name: 'Capital Group', url: 'https://www.thecapitalgroup.com'},
  { id: 56, name: 'yelp', display_name: 'Yelp', url: 'http://www.yelp.com/careers'},
  { id: 57, name: 'riotgames', display_name: 'Riot Games', url: 'http://www.riotgames.com/NAinternships'},
  { id: 58, name: 'nutraclick', display_name: 'Nutraclick', url: 'http://www.nutraclick.com/join/internship-program'},
  { id: 59, name: 'earnest', display_name: 'Earnest', url: 'https://www.meetearnest.com/meet-earnest'},
  { id: 60, name: 'qfpay', display_name: 'QFPay', url:''},
  { id: 61, name: 'spark_capital', display_name: 'Spark Capital', url: 'http://sparkcapital.com'},
  { id: 62, name: 'ashoka', display_name: 'Ashoka', url: 'https://www.ashoka.org/careers'},
  { id: 63, name: 'bloomberg', display_name: 'Bloomberg', url: 'http://jobs.bloomberg.com/'},
  { id: 64, name: 'quantlab', display_name: 'Quantlab Financial', url: 'http://www.quantlab.com/' },
  { id: 65, name: 'interactive_intelligence', display_name: 'Interactive Intelligence', url: 'http://www.inin.com/careers/pages/default.aspx'},
  { id: 66, name: 'dyknow', display_name: 'DyKnow', url: 'http://www.dyknow.com/about-dyknow-software/careers/'},
  { id: 67, name: 'appnexus', display_name: 'AppNexus', url: 'http://careers.appnexus.com/' },
  { id: 68, name: 'imc', display_name: 'IMC', url: 'http://www.imc.nl/yourcareer' },
  { id: 69, name: 'betterment', display_name: 'Betterment', url: 'https://www.betterment.com/' },
  { id: 70, name: 'cringle', display_name: 'Cringle GmbH', url: 'http://www.cringle.net/' }
]

def seed_ruby_objects(model, records)
  records.each do |record|
    model_instance = model.send(:where, { :id => record[:id] }).first
    if model_instance.nil?
      model.send(:create, record)
    else
      model_instance.update_attributes(record)
    end
  end
end

puts "Seeding schools ... "
seed_ruby_objects(School, schools)
puts "Done."

puts "Seeding companies..."
seed_ruby_objects(Company, companies)
puts "Done."

puts "Please download http://download.maxmind.com/download/worldcities/worldcitiespop.txt.gz to seed"
