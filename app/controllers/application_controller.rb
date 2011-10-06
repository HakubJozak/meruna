# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :users, :layout
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user

  # TODO - uncomment and use different strategy in test
  # protected

  def require_no_user
    if current_user
      logger.warn "Accessing login page when already logged in"
      store_location
      flash[:notice] = "You must NOT be logged in to access this page"
      redirect_to root_url
      return false
    end
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
end
