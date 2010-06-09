class ModalitiesController < ApplicationController
  # GET /modalities
  # GET /modalities.xml
  def index
    @modalities = Modality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @modalities }
    end
  end

  # GET /modalities/1
  # GET /modalities/1.xml
  def show
    @modality = Modality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @modality }
    end
  end

  # GET /modalities/new
  # GET /modalities/new.xml
  def new
    @modality = Modality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @modality }
    end
  end

  # GET /modalities/1/edit
  def edit
    @modality = Modality.find(params[:id])
  end

  # POST /modalities
  # POST /modalities.xml
  def create
    @modality = Modality.new(params[:modality])

    respond_to do |format|
      if @modality.save
        flash[:notice] = 'Modality was successfully created.'
        format.html { redirect_to(@modality) }
        format.xml  { render :xml => @modality, :status => :created, :location => @modality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @modality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /modalities/1
  # PUT /modalities/1.xml
  def update
    @modality = Modality.find(params[:id])

    respond_to do |format|
      if @modality.update_attributes(params[:modality])
        flash[:notice] = 'Modality was successfully updated.'
        format.html { redirect_to(@modality) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @modality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /modalities/1
  # DELETE /modalities/1.xml
  def destroy
    @modality = Modality.find(params[:id])
    @modality.destroy

    respond_to do |format|
      format.html { redirect_to(modalities_url) }
      format.xml  { head :ok }
    end
  end
end
