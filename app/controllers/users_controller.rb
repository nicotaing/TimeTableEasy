class UsersController < ApplicationController
  before_filter :require_user
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @title = "Edit Profile"
    @user = User.find(params[:id])
    
    if @current_user.role == 'admin' && ((@user.role == 'student') || (@user.role == 'cm') || (@user.role == 'teacher'))
      
      if @user.role == "student"
        render :edit_student, :layout => 'popup'
      elsif @user.role == "cm"
        render :edit_cm, :layout => 'popup'
      elsif @user.role == "teacher"
        render :edit_teacher, :layout => 'popup'
      end
    
    elsif @user.role == @current_user.role  
      render :edit_his_own_info, :layout => 'popup'
    elsif @user.role == "student"
      render :show_student, :layout => 'popup'
    end
    
  end
  
  def update
    @user = User.find(params[:user][:id])# makes our views "cleaner" and more consistent
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      @title = "Success!"
      render :success, :layout => 'popup'
    else
      @title = "Update failed"
      render :edit_student, :layout => 'popup'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to('/manage/users') }
    end
  end
  
end
