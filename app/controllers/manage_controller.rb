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
    @users = User.all
  end
  
end