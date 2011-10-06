class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user = User.new
    @code
  end
  
  def create
    @user = User.new(params[:user])
    RegistrationKey.find_by_code(registration_code)

    @user.save do |result|
      if result
        flash[:notice] = "Registration successful."
        redirect_to root_url
      else
        render :action => 'new'
      end
    end
  end

  private

  # Kind of hack to check code also on the redirect from OpenID server
  def registration_code
    flash[:code] ||= params[:code]
  end

end
