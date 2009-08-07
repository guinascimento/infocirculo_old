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
      flash[:notice] = "Experiência Profissional adicionada com sucesso."
      redirect_to :controller => "profile", :action => "index"
    else
      render :action => 'new'  
    end  
  end

  # PUT /experiences/1
  # PUT /experiences/1.xml
  def update
    @experience = Experience.find(params[:id])

    if params[:experience][:working] == '1'
      params[:experience]['end(1i)'] = ''
      params[:experience]['end(2i)'] = ''
      params[:experience]['end(3i)'] = ''
    end

    if @experience.update_attributes(params[:experience])
      flash[:notice] = "Experiência Profissional atualizada com sucesso."
      redirect_to :controller => "profile", :action => "index"
    else
      render :action => 'new'
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.xml
  def destroy
    @experience = Experience.find(params[:id])
    if @experience.destroy
      flash[:notice] = "Experiência Profissional removida com sucesso."
      redirect_to :controller => "profile", :action => "index"
    end
  end
end
