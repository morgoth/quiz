class MassExamsController < ApplicationController
  before_filter :require_teacher

  def new
    @mass_exam = MassExam.new
  end

  def create
    @mass_exam = @current_user.mass_exams.build(params[:mass_exam])
    if @mass_exam.save
      flash[:notice] = "Exams created"
      redirect_to new_mass_exam_path
    else
      render :new
    end
  end

end
