class StudentImportsController < ApplicationController
  before_filter :require_teacher

  def new
    @student_import = StudentImport.new
  end

  def create
    @student_import = @current_user.student_imports.build(params[:student_import])
    if @student_import.save
      flash[:notice] = t("controllers.notice.student_import_created")
      redirect_to students_path
    else
      render :new
    end
  end

end
