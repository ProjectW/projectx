class Admin::StatsController < Admin::AdminBaseController
  include Shared::AngularHelper

  REVIEWS_LIMIT = 50

  def index
    with_standard_render do
      {
        admin_name: @current_admin.first_name + " " + @current_admin.last_name,
        confirmed_accounts: StudentAccount.where.not(:confirmed_at => nil).count,
        unconfirmed_accounts: StudentAccount.where(:confirmed_at => nil).count,
        one_page_view: CompanyProfileView.select("DISTINCT(student_account_id)").count,
        three_page_view: CompanyProfileView.select(:student_account_id).group(:student_account_id).count.keep_if{ |k, v| v > 2}.length,
        ten_page_view: CompanyProfileView.select(:student_account_id).group(:student_account_id).count.keep_if{ |k, v| v > 9}.length,
        total_page_views: CompanyProfileView.where.not(:student_account_id => StudentAccount.get_admins.map(&:id)).count,
        uniq_resumes: Resume.all.map(&:student_account_id).uniq.length,
        reviews: Review.includes([:student_account, :company]).order(:created_at => :desc).limit(REVIEWS_LIMIT).map{ |review| get_review_json(review) }
      }
    end
  end

  private

  def get_review_json(review)
    review.as_json.merge({
      :studentAccount => {
        :first_name => review.student_account.first_name,
        :last_name => review.student_account.last_name
      },
      :company => {
        :display_name => review.company.display_name
      }
    })
  end

end
