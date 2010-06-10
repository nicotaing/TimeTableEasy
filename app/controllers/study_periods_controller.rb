class StudyPeriodsController < ApplicationController
  # GET /study_periods
  # GET /study_periods.xml
  def index
    cursus_id = params[:cursus_id]
    if cursus_id
      @study_periods = StudyPeriod.find(:all, :conditions => ["cursus_id = #{cursus_id}"])
    else
      @study_periods = StudyPeriod.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @study_periods }
      format.js   { render :json => @study_periods }
    end
  end

  # GET /study_periods/1
  # GET /study_periods/1.xml
  def show
    @study_period = StudyPeriod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @study_period }
    end
  end

  # GET /study_periods/new
  # GET /study_periods/new.xml
  def new
    @study_period = StudyPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @study_period }
    end
  end

  # GET /study_periods/1/edit
  def edit
    @study_period = StudyPeriod.find(params[:id])
  end

  # POST /study_periods
  # POST /study_periods.xml
  def create
    @study_period = StudyPeriod.new(params[:study_period])

    respond_to do |format|
      if @study_period.save
        flash[:notice] = 'StudyPeriod was successfully created.'
        format.html { redirect_to(@study_period) }
        format.xml  { render :xml => @study_period, :status => :created, :location => @study_period }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @study_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /study_periods/1
  # PUT /study_periods/1.xml
  def update
    @study_period = StudyPeriod.find(params[:id])

    respond_to do |format|
      if @study_period.update_attributes(params[:study_period])
        flash[:notice] = 'StudyPeriod was successfully updated.'
        format.html { redirect_to(@study_period) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @study_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /study_periods/1
  # DELETE /study_periods/1.xml
  def destroy
    @study_period = StudyPeriod.find(params[:id])
    @study_period.destroy

    respond_to do |format|
      format.html { redirect_to(study_periods_url) }
      format.xml  { head :ok }
    end
  end
end
