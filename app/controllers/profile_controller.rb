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

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Dados atualizados com sucesso."
      redirect_to(:action => token)
    else
      render(:action => token)
    end
  end

end
