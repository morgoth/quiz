class StudentsController < ApplicationController
  before_filter :require_teacher

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:notice] = "Student added"
      redirect_to students_path
    else
      render :action => :new
    end
  end
end