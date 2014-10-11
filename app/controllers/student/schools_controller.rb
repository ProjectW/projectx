class Student::SchoolsController < Student::StudentBaseController
  include Shared::AngularHelper

  before_action :set_current_student
  around_action :with_render_exception

  def search
    search_text = params[:searchText]
    schools = School.where('display_name LIKE ?', '%' + search_text + '%')

    render :json => schools.map{|school| get_school_json(school) }
  end

  private

  def get_school_json(school)
    {
      :id => school.id,
      :name => school.display_name
    }
  end

end
