class UserSessionsController < ApplicationController
  
  layout 'login'
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])  
    @user_session.save do |result|
      if result
        flash[:notice] = t('user.login_ok')
        redirect_to(admin_url)
      else
        render(:action => :new)
      end
    end
    
    render(:action => :new) rescue ActionController::DoubleRenderError
  end    

  def destroy
    @user_session = UserSession.find
    @user_session.destroy  
    flash[:notice] = t('user.logout_ok')
    redirect_to root_url  
  end  
end
