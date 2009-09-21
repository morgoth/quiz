class StudentsController < ApplicationController
  before_filter :require_teacher

  def index
    @students = Student.all
    @students = params[:group].nil? ? Student.all : Student.find_tagged_with(params[:group])
    @groups = Student.group_counts
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:notice] = t("controllers.notice.student_created")
      redirect_to students_path
    else
      render :action => :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:notice] = t("controllers.noitce.student_updated")
      redirect_to students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find params[:id]
    @student.destroy
    flash[:notice] = t("controllers.notice.student_destroyed")
    redirect_to students_path
  end
end