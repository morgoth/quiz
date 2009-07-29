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

    respond_to do |format|
      if @teacher_answer.save
        flash[:notice] = 'Answer was successfully created.'
        format.html { redirect_to(@teacher_answer.teacher_question) }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    @teacher_answer = TeacherAnswer.find(params[:id])

    respond_to do |format|
      if @teacher_answer.update_attributes(params[:teacher_answer])
        flash[:notice] = 'Answer was successfully updated.'
        format.html { redirect_to(@teacher_answer.teacher_question) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @teacher_answer = TeacherAnswer.find(params[:id])
    @teacher_answer.destroy

    respond_to do |format|
      format.html { redirect_to(@teacher_answer.teacher_question) }
    end
  end
end
