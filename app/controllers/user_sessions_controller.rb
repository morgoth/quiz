class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t("controllers.notice.user_session_created")
      redirect_to account_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t("controllers.notice.user_session_destroyed")
    redirect_back_or_default new_user_session_url
  end

end
