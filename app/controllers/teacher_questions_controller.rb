class TeacherQuestionsController < ApplicationController
  before_filter :require_teacher

  def index
    @teacher_questions = params[:tag].nil? ? @current_user.teacher_questions.all : @current_user.teacher_questions.find_tagged_with( params[:tag])
    @tags = TeacherQuestion.tag_counts
  end

  def new
    @teacher_question = TeacherQuestion.new
    #@teacher_question.picture = Picture.new
  end

  def create
    @teacher_question = @current_user.teacher_questions.build(params[:teacher_question])
    if @teacher_question.save
      flash[:notice] = t("controllers.notice.question_created")
      redirect_to teacher_question_path @teacher_question
    else
      render :action => :new
    end
  end

  def show
    @teacher_question = @current_user.teacher_questions.find(params[:id])

  end

  def edit
    @teacher_question = @current_user.teacher_questions.find(params[:id], :include => :teacher_answers)
  end

  def update
    @teacher_question = @current_user.teacher_questions.find(params[:id])
    if @teacher_question.update_attributes(params[:teacher_question])
      flash[:notice] = t("controllers.notice.question_updated")
      redirect_to teacher_questions_path
    else
      render :action => :edit
    end
  end

  def destroy
    @teacher_question = @current_user.teacher_questions.find(params[:id])
    @teacher_question.destroy
    flash[:notice] = t("controllers.notice.question_destroyed")
    redirect_to teacher_questions_path
  end
end
