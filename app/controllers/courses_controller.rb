class CoursesController < ApplicationController
  before_filter :require_user
  
  def index
    @title = "Courses List"
    #@courses = Course.all
    #@courses = Course.paginate :page => params[:page]
    
    classe_id = params[:classe_id]
    if classe_id
      @classe = Classe.find(classe_id)
      @courses = Course.find(:all, :conditions => ["study_period_id = #{@classe.study_period.id}"])
    else
      @courses = Course.all
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @courses }
      format.js   { render :json => @courses }
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
