class TeacherExamsController < ApplicationController
  before_filter :require_teacher

  def index
    @teacher_exams = @current_user.teacher_exams
  end

  def show
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
  end

  def new
    @teacher_exam = TeacherExam.new
  end

  def edit
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
  end

  def create
    @teacher_exam = @current_user.teacher_exams.build(params[:teacher_exam])
    if @teacher_exam.save
      flash[:notice] = t("controllers.notice.teacher_exam_created")
      redirect_to(@teacher_exam)
    else
      render :action => "new"
    end
  end

  def update
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
    if @teacher_exam.update_attributes(params[:teacher_exam])
      flash[:notice] = t("controllers.notice.teacher_exam_updated")
      redirect_to(@teacher_exam)
    else
      render :action => "edit"
    end
  end

  def destroy
    @teacher_exam = @current_user.teacher_exams.find(params[:id])
    @teacher_exam.destroy
    flash[:notice] = t("controllers.notice.teacher_exam_destroyed")
    redirect_to(teacher_exams_url)
  end
end
