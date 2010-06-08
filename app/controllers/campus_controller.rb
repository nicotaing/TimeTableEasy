class CampusController < ApplicationController
  
  before_filter :require_user
  
  def index
    @title = "Campus List"
    @campus = Campus.all
  end
  
  def new
    @title = "Create a New Campus"
    @campus = Campus.new
  end
  
  def create
    @campus = Campus.new(params[:campus])
    
    respond_to do |format| 
      if @campus.save
        format.html { redirect_to(@campus, :notice => 'Campus was successfully created.') }
        format.xml  { render :xml => @campus, :status => :created, :location => @campus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @campus = Campus.find(params[:id])
    @title = @campus.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
end
