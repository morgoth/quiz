class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  filter_parameter_logging :password
  helper_method :current_user_session, :current_user, :teacher, :student
  before_filter :set_locale, :store_location

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def teacher
    current_user if current_user && current_user.type == 'Teacher'
  end

  def student
    current_user if current_user && current_user.type == 'Student'
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = t("controllers.notice.require_user")
      redirect_to new_user_session_url
      return false
    end
  end

  def require_teacher
    unless current_user and current_user.teacher?
      store_location
      flash[:notice] = t("controllers.notice.require_teacher")
      redirect_to new_user_session_url
      return false
    end
  end

  def require_student
    unless current_user and current_user.student?
      store_location
      flash[:notice] = t("controllers.notice.require_student")
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = t("controllers.notice.require_no_user")
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request_uri_without_locale if request.get? and controller_name != "user_sessions"
  end

  def redirect_back_or_default(default)
    redirect_to(return_to_with_locale || default)
  end

  def set_locale
    I18n.locale = locale
  end

  def locale
    params[:locale] or I18n.default_locale #locale_from_browser
  end

  def locale_from_browser
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
    browser_locale if I18n.available_locales.map(&:to_s).include?(browser_locale)
  end

  def request_uri_without_locale
    locales = I18n.available_locales.map { |l| Regexp.escape(l.to_s) }.join("|")
    request.request_uri.sub(/\A\/(#{locales})\//, "/")
  end

  def return_to_with_locale
    if params[:language]
      "/#{params[:language]}#{session[:return_to]}" if session[:return_to]
    else
      session[:return_to]
    end
  end
end
