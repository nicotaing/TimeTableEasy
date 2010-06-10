class ManageController < ApplicationController
  before_filter :require_user
  
  def university
    @title = "Manage"
    @tab_university = 'active'
  end
  
  def campus
    @title = "Manage"
    @tab_campus = 'active'
    @campus = Campus.all
  end
  
  def cursus
    @title = "Manage"
    @tab_cursus = 'active'
    @cursus = Cursus.all
  end
  
  def users
    @title = "Manage"
    @tab_users = 'active'
    
    if params[:filter] == "admin"
      @users = User.find_all_by_role("admin")
    elsif params[:filter] == "cm"
      @users = User.find_all_by_role("cm")
    elsif params[:filter] == "teacher"
      @users = User.find_all_by_role("teacher")
    elsif params[:filter] == "student"
      @users = User.find_all_by_role("student")
    else
      @users = User.all
    end
  end
  
end