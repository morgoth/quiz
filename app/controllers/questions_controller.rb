class QuestionsController < ApplicationController
  before_filter :require_student
  before_filter :fetch_exam

  def edit
    @question = @exam.questions.find(params[:id])
  end

  def update
    @question = @exam.questions.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to edit_exam_question_path(@exam, rotate_question(@question)) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  private

  def rotate_question(question)
    question.last? ? @exam.questions.first : question.lower_item
  end

  def fetch_exam
    @exam = @current_user.exams.find(params[:exam_id])
  end
end
