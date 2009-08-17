class IdiomsController < ApplicationController
  layout "application"
  
  # GET /idioms
  # GET /idioms.xml
  def index
    @idioms = Idiom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @idioms }
    end
  end

  # GET /idioms/1
  # GET /idioms/1.xml
  def show
    @idiom = Idiom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idiom }
    end
  end

  # GET /idioms/new
  # GET /idioms/new.xml
  def new
    @idiom = Idiom.new
    @curriculum = find_curriculum_from_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idiom }
    end
  end

  # GET /idioms/1/edit
  def edit
    @idiom = Idiom.find(params[:id])
    @curriculum = find_curriculum_from_user
  end

  # POST /idioms
  # POST /idioms.xml
  def create
    @idiom = Idiom.new(params[:idiom])
    @curriculum = find_curriculum_from_user

    if @idiom.save
      flash[:notice] = "Idioma adicionado com sucesso."
      redirect_to :controller => "profile", :action => "index"
    else
      render :action => 'new'
    end  
  end

  # PUT /idioms/1
  # PUT /idioms/1.xml
  def update
    @idiom = Idiom.find(params[:id])

    if @idiom.update_attributes(params[:idiom])
      flash[:notice] = "Idioma atualizado com sucesso."
      redirect_to :controller => "profile", :action => "index"
    else
      render :action => 'new'
    end
  end

  # DELETE /idioms/1
  # DELETE /idioms/1.xml
  def destroy
    @idiom = Idiom.find(params[:id])
    @idiom.destroy

    respond_to do |format|
      format.html { redirect_to(idioms_url) }
      format.xml  { head :ok }
    end
  end
end
