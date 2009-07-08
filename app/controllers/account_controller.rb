class AccountController < ApplicationController

  def index
    @account = User.find_by_id(current_user.id)
  end
    
  def update
    @account = User.find(params[:id])
    @success = @account.update_attributes(params[:account])

    if @success && @account.errors.empty?
      flash[:notice] = "Sua conta foi atualizada com sucesso."
      redirect_to(:action => 'index')
    else
      render(:action => 'index')
    end
  end
	
  def avatar
    @account = User.find(params[:id])
	@success = @account.update_attributes(params[:account])

    if @success && @account.errors.empty?
      flash[:notice] = "Imagem carregada com sucesso."
      redirect_to(:action => 'index')
    end
  end

  def get_cities
    @cities = City.find(:all, :conditions => ["state_id = ?", params[:state_id]])
    render :partial => 'select'
  end

end