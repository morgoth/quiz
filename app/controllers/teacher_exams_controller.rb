class TeacherExamsController < ApplicationController
  before_filter :require_teacher

  def index
    @teacher_exams = @current_user.teacher_exams
    respond_to do |format|
      format.html
    end
  end

  def show
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @teacher_exam = TeacherExam.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
  end

  def create
    @teacher_exam = @current_user.teacher_exams.build(params[:teacher_exam])
    respond_to do |format|
      if @teacher_exam.save
        flash[:notice] = 'Exam was successfully created.'
        format.html { redirect_to(@teacher_exam) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
    respond_to do |format|
      if @teacher_exam.update_attributes(params[:teacher_exam])
        flash[:notice] = 'Exam was successfully updated.'
        format.html { redirect_to(@teacher_exam) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
    @teacher_exam.destroy
    respond_to do |format|
      format.html { redirect_to(teacher_exams_url) }
    end
  end
end
