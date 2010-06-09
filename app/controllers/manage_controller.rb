class ManageController < ApplicationController
  before_filter :require_user
  
  def university
    @title = "Manage"
    @tab_university = 'active'
  end
  
  def campus
    @title = "Manage"
    @tab_campus = 'active'
  end
  
  def cursus
    @title = "Manage"
    @tab_cursus = 'active'
  end
  
  def users
    @title = "Manage"
    @tab_users = 'active'
  end
  
end
