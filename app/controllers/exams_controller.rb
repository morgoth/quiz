class ExamsController < ApplicationController
  before_filter :require_teacher, :only => [:new, :create, :destroy]
  before_filter :require_student, :only => [:index, :update, :edit, :show]

  def index
    @exams = @current_user.exams
    respond_to do |format|
      format.html
    end
  end

  def show
    @exam = Exam.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @exam = Exam.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @exam = @current_user.exams.find(params[:id])
  end

  def create
    @exam = Exam.new(params[:exam])
    respond_to do |format|
      if @exam.save
        flash[:notice] = 'Exam was successfully created.'
        format.html { redirect_to( root_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @exam = @current_user.exams.find(params[:id])
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        flash[:notice] = 'Exam started'
        format.html { redirect_to edit_exam_question_path @exam, @exam.questions.first }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to(exams_url) }
    end
  end
end
