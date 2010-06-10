class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @title = "Login"
    @user_session = UserSession.new
    render :layout => "login"
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default '/events/'
    else
      redirect_to '/login'
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_path
  end
    
end
