class Company < ActiveRecord::Base
  MOST_REVIEWED_LIMIT = 50
  MOST_VIEWED_LIMIT = 50

  has_many :company_accounts
  has_many :reviews
  has_many :views, :foreign_key => 'company_id', :class_name => 'CompanyProfileView'
  has_many :watches, :foreign_key => 'company_id', :class_name => 'CompanyProfileWatch'

  def self.most_reviewed(limit = MOST_REVIEWED_LIMIT)
    Company.joins(:reviews).group('reviews.company_id').order('count(reviews.company_id) desc').limit(limit)
  end

  def self.most_viewed(limit = MOST_VIEWED_LIMIT)
    Company.joins(:views).group('company_profile_views.company_id').order('count(company_profile_views.company_id) desc').limit(limit)
  end

  def watch(student_account_id, watching = true)
    watches = self.watches.where(:student_account_id => student_account_id)

    if watches.length < 1
      CompanyProfileWatch.create(:student_account_id => student_account_id, :company_id => self.id)
    elsif watches.length == 1
      watch = watches.first
      watch.watching = watching
      watch.save!
    else
      raise "Database error, duplicate watch for student_account_id: #{student_account_id}"
    end
  end

  def watching?(student_account_id)
    self.watches.select(:student_account_id).where(watching: true).map(&:student_account_id).include?(student_account_id)
  end
end
