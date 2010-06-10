class UsersController < ApplicationController
  before_filter :require_user
  
  def index
    @users = User.all
  end
  
  def new
    #redirect_to '/' if @current_user.role != 'admin'
    @user = User.new
    
    role = params[:role]
    
    if role == 'admin'
      @title = "New Administator"
      render :new_admin, :layout => 'popup'
    elsif role == 'cm'
      @title = "New Campus Manager"
      render :new_cm, :layout => 'popup'
    elsif role == 'teacher'
      @title = "New Teacher"
      render :new_teacher, :layout => 'popup'
    else
      @title = "New Student"
      render :new_student, :layout => 'popup'
    end    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account created!"
      @title = "Success!"
      render :new_success, :layout => 'popup'
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
    
    elsif @current_user.role == 'admin' && @user.role == 'admin'
      render :edit_admin, :layout => 'popup'
    elsif @user.id == @current_user.id 
      render :edit_his_own_info, :layout => 'popup'
    else
      render :show, :layout => 'popup'
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
