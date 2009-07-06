class QuestionsController < ApplicationController
  before_filter :require_student
  before_filter :fetch_exam
  before_filter :exam_finished, :only => [:edit, :update]
  before_filter :show_results, :only => [:index]

  def index
    @questions = @exam.questions
  end

  def edit
    @question = @exam.questions.find(params[:id], :include => :answers)
  end

  def update
    @question = @exam.questions.find(params[:id])
    params[:question][:update_answers] ||= {}
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
    case params[:commit]
    when 'finish'
      @exam.finish
      question
    when 'next'
      question.last? ? @exam.questions.first : question.lower_item
    else
      @exam.questions.find_by_position(params[:commit])
    end
  end

  def fetch_exam
    @exam = @current_user.exams.find(params[:exam_id])
  end

  def show_results
    unless @exam.finished?
      flash[:notice] = "You can see questions after finishing exam"
      redirect_to exams_path
    end
  end

  def exam_finished
    if @exam.finished?
      flash[:notice] = "Exam finished"
      redirect_to exams_path
    end
  end
end
