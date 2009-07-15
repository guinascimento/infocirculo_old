class ProfileController < ApplicationController
  before_filter :login_required

  def index
    @profile = Curriculum.find_by_user_id(current_user.id)
  end

  def summary
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end

  def personal_informations
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end
  
  def update
    @curriculum = Curriculum.find(params[:id])
    @success = @curriculum.update_attributes(params[:curriculum])

    # Used to identify the page is being edited
    token = params[:token]
    puts token

    if @success && @curriculum.errors.empty?
      flash.now[:notice] = "Dados atualizados com sucesso."
    end
    
    render(:action => token)
  end

end
