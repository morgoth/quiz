class ExamsController < ApplicationController
  before_filter :require_teacher, :only => [:new, :create]

  def index
    @exams = Exam.all
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
    @exam = Exam.find(params[:id])
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
    params[:exam][:question_ids] ||= [] #see railscasts episode 17 why it's necessary
    params[:exam][:student_ids] ||= []
    params[:exam][:finished_preparing] ||= '0'
    @exam = Exam.find(params[:id])
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        flash[:notice] = 'Exam was successfully updated.'
        format.html { redirect_to(@exam) }
      else
        format.html { render :action => "edit" }
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
