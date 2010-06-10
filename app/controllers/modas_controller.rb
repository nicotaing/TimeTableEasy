class ModasController < ApplicationController
  # GET /modas
  # GET /modas.xml
  def index
    @modas = Moda.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @modas }
    end
  end

  # GET /modas/1
  # GET /modas/1.xml
  def show
    @moda = Moda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @moda }
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
