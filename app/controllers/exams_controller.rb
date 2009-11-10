class ExamsController < ApplicationController
  before_filter :require_teacher, :only => [:new, :create, :destroy]
  before_filter :require_student, :only => [:index, :update, :edit, :show]

  def index
    @exams = @current_user.exams
  end

  def show
    @exam = @current_user.exams.find(params[:id])
  end

  def new
    @exam = Exam.new
  end

  def edit
    @exam = @current_user.exams.find(params[:id])
  end

  def create
    @exam = Exam.new(params[:exam])
    if @exam.save
      flash[:notice] = t("controllers.notice.exam_created")
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @exam = @current_user.exams.find(params[:id])
    if @exam.update_attributes(params[:exam])
      flash[:notice] = t("controllers.notice.exam_started")
      redirect_to edit_exam_question_path @exam, @exam.questions.first
    else
      flash[:notice] = t("controllers.notice.exam_not_started")
      render :edit
    end
  end

  def destroy
    @exam = @current_user.exams.find(params[:id])
    @exam.destroy
    flash[:notice] = t("controllers.notice.exam_destroyed")
    redirect_to exams_url
  end
end
