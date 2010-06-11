class ClassesController < ApplicationController
  # GET /classes
  # GET /classes.xml
  def index
    
    campus_id = params[:campus_id]
    if campus_id
      @classes = Classe.find(:all, :conditions => ["campus_id = #{campus_id}"])
    else
      @classes = Classe.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classes }
      format.js  { render :json => @classes }
    end
  end

  # GET /classes/1
  # GET /classes/1.xml
  def show
    @title = "Manage Students"
    @classe = Classe.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'popup' }
      format.xml  { render :xml => @classe }
    end
  end

  # GET /classes/new
  # GET /classes/new.xml
  def new
    @classe = Classe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classe }
    end
  end

  # GET /classes/1/edit
  def edit
    @classe = Classe.find(params[:id])
  end

  # POST /classes
  # POST /classes.xml
  def create
    @classe = Classe.new(params[:classe])

    respond_to do |format|
      if @classe.save
        flash[:notice] = 'Classe was successfully created.'
        format.html { redirect_to('/manage/campus') }
        format.xml  { render :xml => @classe, :status => :created, :location => @classe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classes/1
  # PUT /classes/1.xml
  def update
    @classe = Classe.find(params[:id])

    respond_to do |format|
      if @classe.update_attributes(params[:classe])
        flash[:notice] = 'Classe was successfully updated.'
        format.html { redirect_to(@classe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classes/1
  # DELETE /classes/1.xml
  def destroy
    @classe = Classe.find(params[:id])
    @classe.destroy

    respond_to do |format|
      format.html { redirect_to(classes_url) }
      format.xml  { head :ok }
    end
  end
  
  # Add a student to the class
  # Parameter : user_id
  def add_student
    @classe = Classe.find(params[:id])
    @user = User.find(params[:user][:id])
    
    @user.classe_id = @classe.id
    if @user.save
      flash[:notice] = "Account updated!"
      @title = "Success!"
      redirect_to "/classes/#{@classe.id}"
    else
      @title = "Update failed"
      render :failure, :layout => 'popup'
    end
  end
  
  # Remove a student to the class
  # Parameter : user_id
  def remove_student
    @user = User.find(params[:id])
    old_classe_id = @user.classe_id 
    @user.classe_id = nil
    if @user.save
      flash[:notice] = "Account updated!"
      @title = "Success!"
      redirect_to "/classes/#{old_classe_id}"
    else
      @title = "Update failed"
      render :failure, :layout => 'popup'
    end
  end
  
  
  
end
