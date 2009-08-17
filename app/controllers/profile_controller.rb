class ProfileController < ApplicationController
  before_filter :login_required

  def index
    @profile = find_curriculum_from_user
  end

  def summary
    @curriculum = find_curriculum_from_user
  end

  def personal_informations
    @curriculum = find_curriculum_from_user
  end
  
  def update
    @curriculum = Curriculum.find(params[:id])
    @success = @curriculum.update_attributes(params[:curriculum])

    # Used to identify the page is being edited
    token = params[:token]

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Dados atualizados com sucesso."
      redirect_to :action => "index"
    else
      render :action => token
    end

  end

  def public_profile
    
  end

end
