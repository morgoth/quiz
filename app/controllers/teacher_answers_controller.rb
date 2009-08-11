class TeacherAnswersController < ApplicationController
  before_filter :require_teacher

  def new
    @teacher_answer = TeacherAnswer.new
    @teacher_answer.picture = Picture.new
  end

  def edit
    @teacher_answer = TeacherAnswer.find(params[:id])
  end

  def create
    @teacher_answer = TeacherAnswer.new(params[:teacher_answer])
    if @teacher_answer.save
      flash[:notice] = t("controllers.notice.teacher_answer_created")
      redirect_to(@teacher_answer.teacher_question)
    else
      render :new
    end
  end

  def update
    @teacher_answer = TeacherAnswer.find(params[:id])
    if @teacher_answer.update_attributes(params[:teacher_answer])
      flash[:notice] = t("controllers.notice.teacher_answer_updated")
      redirect_to(@teacher_answer.teacher_question)
    else
      render :edit
    end
  end

  def destroy
    @teacher_answer = TeacherAnswer.find(params[:id])
    @teacher_answer.destroy
    flash[:notice] = t("controllers.notice.teacher_answer_destroyed")
    redirect_to(@teacher_answer.teacher_question)
  end
end
