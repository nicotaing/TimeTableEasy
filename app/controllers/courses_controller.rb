class CoursesController < ApplicationController
  before_filter :require_user
  
  def index
    @title = "Courses List"
    @courses = Course.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @courses }
    end
  end
  
  def show
    @course = Course.find(params[:id])
    @title = @course.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
end
