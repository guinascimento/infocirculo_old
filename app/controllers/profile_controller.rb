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
  
  def string_method
    # Realizando modificações importantes nesse metodo
    age = 20
    name = "Maria"
  end

  def public_profile
    # Desired name in URL
    cv = params[:cv]
    
    if cv.eql?("")
      render :text => "URL inválida."
    else
      # Searching if the name used in URL already exists in database
      exists = User.find(:all, :conditions => [ "cv = ?", cv ]).size

      # If name isn't used
      if exists == 0
        # Updating the 'cv' column with de value configured by user
        @user = User.find(current_user.id)    
        @success = @user.update_attribute(:cv, params[:cv])
  
        render :text => "URL customizada com sucesso."
      else
        render :text => "Essa URL já está sendo utilizada."
      end
    end
  end

end