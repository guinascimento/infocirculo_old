class ProfileController < ApplicationController
  before_filter :login_required

  def index
    @profile = Curriculum.find_by_user_id(current_user.id)
  end

  def summary
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    @success = @curriculum.update_attributes(params[:curriculum])

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Dados atualizados com sucesso."
      redirect_to(:back)
    else
      render(:action => 'index')
    end
  end

  def personal_informations
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end

  def update_personal_informations
    @curriculum = Curriculum.find(params[:id])
    @success = @curriculum.update_attributes(params[:curriculum])

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Informações pessoais atualizadas com sucesso."
      redirect_to(:action => 'personal_informations')
    else
      render(:action => 'personal_informations')
    end
  end

end
