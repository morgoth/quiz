class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t("controllers.notice.user_session_created")
      redirect_to root_path
      # redirect_back_or_default account_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t("controllers.notice.user_session_destroyed")
    redirect_to root_path
    #redirect_back_or_default root_path
  end
end
