class Company < ActiveRecord::Base
  MOST_REVIEWED_LIMIT = 3
  MOST_VIEWED_LIMIT = 3

  has_many :company_accounts
  has_many :reviews
  has_many :views, :foreign_key => 'company_id', :class_name => 'CompanyProfileView'

  def self.most_reviewed(limit = MOST_REVIEWED_LIMIT)
    Company.joins(:reviews).group('reviews.company_id').order('count(reviews.company_id) desc').limit(limit)
  end

  def self.most_viewed(limit = MOST_VIEWED_LIMIT)
    Company.joins(:views).group('company_profile_views.company_id').order('count(company_profile_views.company_id) desc').limit(limit)
  end

end
