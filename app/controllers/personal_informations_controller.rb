class PersonalInformationsController < ApplicationController
  before_filter :login_required

  def index 
    @curriculum = Curriculum.find_by_user_id(current_user.id)
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    puts params[:curriculum]
    @success = @curriculum.update_attributes(params[:curriculum])

    if @success && @curriculum.errors.empty?
      flash[:notice] = "Informações pessoais atualizadas com sucesso."
      redirect_to(:action => 'index')
    else
      render(:action => 'index')
    end
  end
end
