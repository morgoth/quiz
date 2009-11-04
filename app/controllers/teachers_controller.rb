class TeachersController < ApplicationController
  before_filter :require_no_user

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      flash[:notice] = t("controllers.notice.teacher_created")
      redirect_to account_path
    else
      render :new
    end
  end
end