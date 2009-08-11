class UsersController < ApplicationController
  before_filter :require_user

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = t("controllers.notice.account_updated")
      redirect_to account_path
    else
      render :action => :edit
    end
  end
end
