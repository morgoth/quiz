class TeacherQuestionsController < ApplicationController
  before_filter :require_teacher

  def index
    @teacher_questions = params[:tag].nil? ? TeacherQuestion.all : TeacherQuestion.find_tagged_with( params[:tag])
    @tags = TeacherQuestion.tag_counts
  end

  def new
    @teacher_question = TeacherQuestion.new
  end

  def create
    @teacher_question = TeacherQuestion.new(params[:teacher_question])
    if @teacher_question.save
      flash[:notice] = "Question created"
      redirect_to teacher_question_path @teacher_question
    else
      render :action => :new
    end
  end

  def show
    @teacher_question = TeacherQuestion.find(params[:id])
  end

  def edit
    @teacher_question = TeacherQuestion.find(params[:id])
  end

  def update
    @teacher_question = TeacherQuestion.find(params[:id])
    if @teacher_question.update_attributes(params[:teacher_question])
      flash[:notice] = "Question updated"
      redirect_to teacher_questions_path
    else
      render :action => :edit
    end
  end

  def destroy
    @teacher_question = TeacherQuestion.find(params[:id])
    @teacher_question.destroy
    flash[:notice] = "Question deleted"
    redirect_to teacher_questions_path
  end
end
