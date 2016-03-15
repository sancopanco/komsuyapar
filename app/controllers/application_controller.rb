class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def signed_in?
    !current_user.nil?
  end

  def store_location
    session[:return_to] = request.url if request.get? && !request.xhr?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_url, notice: "Lütfen giriş yapınız."
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def signed_in_user_xhr
    unless signed_in?
      flash[:notice] = "Lütfen giriş yapınız."
      render js: "window.location = '#{root_url}';"
    end
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end