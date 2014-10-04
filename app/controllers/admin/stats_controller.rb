class Admin::StatsController < Admin::AdminBaseController
  REVIEWS_LIMIT = 50


  def index
    @confirmed_accounts = StudentAccount.count
    @unconfirmed_accounts = StudentAccount.where(:confirmed_at => nil).count
    @reviews = Review.count
    @uniq_resumes = Resume.all.map(&:student_account_id).uniq.length

    @reviews = Review.order(:created_at => :desc).limit(REVIEWS_LIMIT)
  end

end
