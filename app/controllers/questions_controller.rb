class QuestionsController < ApplicationController
  before_filter :require_student
  before_filter :fetch_exam
  before_filter :exam_finished, :only => [:edit, :update]
  before_filter :show_results, :only => :index

  def index
    @questions = @exam.questions
  end

  def edit
    @question = @exam.questions.find(params[:id], :include => :answers)
  end

  def update
    @question = @exam.questions.find(params[:id])
    params[:question][:student_answers] ||= {}
    if @question.update_attributes(params[:question])
      redirect_to edit_exam_question_path(@exam, rotate_question(@question))
    else
      render :edit
    end
  end

  private

  def rotate_question(question)
    if params[:finish]
      @exam.finish
      question
    elsif params[:next]
      question.last? ? @exam.questions.first : question.lower_item
    elsif params[:custom]
      @exam.questions.find_by_position(params[:custom])
    end
  end

  def fetch_exam
    @exam = @current_user.exams.find(params[:exam_id])
  end

  def show_results
    unless @exam.finished?
      flash[:notice] = t("controllers.notice.show_results")
      redirect_to exams_path
    end
  end

  def exam_finished
    if @exam.finished?
      flash[:notice] = t("controllers.notice.exam_finished")
      redirect_to exams_path
    end
  end
end
