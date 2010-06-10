class CampusController < ApplicationController
  
  before_filter :require_user
  
  def index
    @title = "Campus List"
    @campus = Campus.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campus }
    end
  end
  
  def new
    @title = "Create a New Campus"
    @campus = Campus.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campus }
    end
  end
  
  def create
    @campus = Campus.new(params[:campus])
    
    respond_to do |format| 
      if @campus.save
        format.html { redirect_to('/manage/campus/', :notice => 'Campus was successfully created.') }
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
  
  # GET /campus/1/edit
  def edit
    @campus = Campus.find(params[:id])
    @title = "Editing "+ @campus.name + " Campus"
  end
  
  # PUT /campus/1
  # PUT /campus/1.xml
  def update
    @campus = Campus.find(params[:id])

    respond_to do |format|
      if @campus.update_attributes(params[:campus])
        format.html { redirect_to(@campus, :notice => 'Campus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy

    respond_to do |format|
      format.html { redirect_to(campus_url) }
      format.xml  { head :ok }
    end
  end
end
