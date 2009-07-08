class ProfileController < ApplicationController
  before_filter :login_required
  
  def index
    @profile = Curriculum.find_by_user_id(current_user.id) 
  end

  def summary
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end

  def update_summary
    @curriculum = Curriculum.find(params[:id])
    @success = @curriculum.update_attributes(params[:curriculum])

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Resumo atualizado com sucesso."
      redirect_to(:action => 'summary')
    else
      render(:action => 'summary')
    end
  end

end
