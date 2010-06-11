class ManageController < ApplicationController
  before_filter :require_user
  
  # University
  def university
    @title = "Manage"
    @tab_university = 'active'
  end
  
  # Campus
  def campus
    @title = "Manage"
    @tab_campus = 'active'
    @campus = Campus.all
  end
  
  # Cursus
  def cursus
    @title = "Manage"
    @tab_cursus = 'active'
    @cursus = Cursus.all
  end
  
  # Users
  def users
    @title = "Manage"
    @tab_users = 'active'
    
    if params[:filter] == "admin"
      @users = User.find_all_by_role("admin")
      @user_id = User.find_all_by_role("admin").collect{|p| [p.id.to_s, p.id]}
    elsif params[:filter] == "cm"
      @users = User.find_all_by_role("cm")
      @user_id = User.find_all_by_role("cm").collect{|p| [p.id.to_s, p.id]}
    elsif params[:filter] == "teacher"
      @users = User.find_all_by_role("teacher")
      @user_id = User.find_all_by_role("teacher").collect{|p| [p.id.to_s, p.id]}
    elsif params[:filter] == "student"
      @users = User.find_all_by_role("student")
      @user_id = User.find_all_by_role("student").collect{|p| [p.id.to_s, p.id]}
    else
      @users = User.all
      @user_id = User.all.collect{|p| [p.id.to_s, p.id]}
    end
  end

  
end