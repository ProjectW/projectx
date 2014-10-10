class Admin::StatsController < Admin::AdminBaseController
  REVIEWS_LIMIT = 50


  def index
    @confirmed_accounts = StudentAccount.where.not(:confirmed_at => nil).count
    @unconfirmed_accounts = StudentAccount.where(:confirmed_at => nil).count
    @one_page_view = CompanyProfileView.select(:student_account_id).distinct.count
    @three_page_view = CompanyProfileView.select(:student_account_id).group(:student_account_id).count.keep_if{ |k, v| v > 2}.length
    @ten_page_view = CompanyProfileView.select(:student_account_id).group(:student_account_id).count.keep_if{ |k, v| v > 9}.length
    @total_page_views = CompanyProfileView.where.not(:student_account_id => StudentAccount.get_admins.map(&:id)).count
    @uniq_resumes = Resume.all.map(&:student_account_id).uniq.length

    @reviews = Review.order(:created_at => :desc).limit(REVIEWS_LIMIT)
  end

end
