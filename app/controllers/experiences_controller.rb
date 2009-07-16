class ExperiencesController < ApplicationController
  layout "application"
  
  # GET /experiences
  # GET /experiences.xml
  def index
    @experiences = Experience.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @experiences }
    end
  end

  # GET /experiences/1
  # GET /experiences/1.xml
  def show
    @experience = Experience.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @experience }
    end
  end

  # GET /experiences/new
  # GET /experiences/new.xml
  def new
    @experience = Experience.new
    @curriculum = find_curriculum_from_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @experience }
    end
  end

  # GET /experiences/1/edit
  def edit
    @experience = Experience.find(params[:id])
  end

  # POST /experiences
  # POST /experiences.xml
  def create
    @experience = Experience.new(params[:experience])
    @curriculum = find_curriculum_from_user

    if @experience.save
      flash.now[:notice] = "Experiência Profissional adicionada com sucesso."
    end
    
    render(:action => "new")
  end

  # PUT /experiences/1
  # PUT /experiences/1.xml
  def update
    @experience = Experience.find(params[:id])

    respond_to do |format|
      if @experience.update_attributes(params[:experience])
        flash[:notice] = 'Experience was successfully updated.'
        format.html { redirect_to(@experience) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @experience.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.xml
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to(experiences_url) }
      format.xml  { head :ok }
    end
  end
end
