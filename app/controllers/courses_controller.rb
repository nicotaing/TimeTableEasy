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
  
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = 'Course was successfully created.'
        format.html { redirect_to('/manage/cursus') }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { redirect_to('/manage/cursus') }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /cursus/1
  # DELETE /cursus/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to('/manage/cursus') }
      format.xml  { head :ok }
    end
  end
  
  def show
    @course = Course.find(params[:id])
    @title = @course.name

    respond_to do |format|
      format.html { render :layout => 'popup' }
      format.xml  { render :xml => @user }
    end
  end
  
  def remaining
    @course = Course.find(26)
    
    render :text => @course.has_currently
  end
  
  def hours
    @course = Course.find(params[:id])
    
    hours = []
    hours << {
      :volume => @course.volume,
      :used => @course.has_currently,
      :remaining => @course.volume - @course.has_currently }
      
    render :text => hours.to_json
  end
  
end
