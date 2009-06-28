class StudentImportsController < ApplicationController
  before_filter :require_teacher

  def new
    @student_import = StudentImport.new
  end

  def create
    @student_import = @current_user.student_imports.build(params[:student_import])
    if @student_import.save
      flash[:notice] = 'Students imported'
      redirect_to(students_path)
    else
      render :action => :new
    end
  end

end
