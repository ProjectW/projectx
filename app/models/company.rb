class Company < ActiveRecord::Base
  MOST_REVIEWED_LIMIT = 3

  has_many :company_accounts
  has_many :reviews

  def self.most_reviewed(limit = MOST_REVIEWED_LIMIT)
    Company.joins(:reviews).group('reviews.company_id').order('count(reviews.company_id) desc').limit(limit)
  end

end
