# Modalities linked to a course
class ModasController < ApplicationController
  # GET /modas
  # GET /modas.xml
  def index
    
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @modas = Moda.find(:all, :conditions => ["course_id = #{@course.id}"])
    else
      @modas = Moda.all
    end
    
    modas = []
    @modas.each do |moda|
      modas << {
        :id => moda.id, 
        :modality_id => moda.modality_id, 
        :modality => Modality.find(moda.modality_id).name, 
        :course_id => moda.course_id, 
        :course => Course.find(moda.course_id).name, 
        :total => moda.volume,
        :remaining => moda.remaining
        }
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => modas }
      format.js   { render :json => modas }
    end
  end

  # GET /modas/1
  # GET /modas/1.xml
  def show
    @moda = Moda.find(params[:id])
    moda = []
      moda << {
        :id => @moda.id, 
        :modality_id => @moda.modality_id, 
        :modality => Modality.find(@moda.modality_id).name, 
        :course_id => @moda.course_id, 
        :course => Course.find(@moda.course_id).name, 
        :total => @moda.volume,
        :remaining => @moda.remaining
        }


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @moda }
      format.js  { render :json => moda }
    end
  end

  # GET /modas/new
  # GET /modas/new.xml
  def new
    @moda = Moda.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @moda }
    end
  end

  # GET /modas/1/edit
  def edit
    @moda = Moda.find(params[:id])
  end

  # POST /modas
  # POST /modas.xml
  def create
    @moda = Moda.new(params[:moda])

    respond_to do |format|
      if @moda.save
        flash[:notice] = 'Moda was successfully created.'
        format.html { redirect_to("/courses/#{@moda.course_id}") }
        format.xml  { render :xml => @moda, :status => :created, :location => @moda }
      else
        format.html { redirect_to("/courses/#{@moda.course_id}") }
        format.xml  { render :xml => @moda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /modas/1
  # PUT /modas/1.xml
  def update
    @moda = Moda.find(params[:id])

    respond_to do |format|
      if @moda.update_attributes(params[:moda])
        flash[:notice] = 'Moda was successfully updated.'
        format.html { redirect_to(@moda) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @moda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /modas/1
  # DELETE /modas/1.xml
  def destroy
    @moda = Moda.find(params[:id])
    course_id = @moda.course_id
    @moda.destroy

    respond_to do |format|
      format.html { redirect_to("/courses/#{course_id}") }
      format.xml  { head :ok }
    end
  end
end
