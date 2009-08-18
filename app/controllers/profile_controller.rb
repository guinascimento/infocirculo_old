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
    # Desired name in URL
    cv = params[:cv]

    # Searching if the name used in URL already exists in database
    exists = User.find(:all, :conditions => [ "cv = ?", cv ]).size

    # If name isn't used
    if exists == 0
      # Updating the 'cv' column with de value configured by user
      @user = User.find(current_user.id)    
      @success = @user.update_attribute(:cv, params[:cv])

      render :text => "URL configurada com sucesso."
    else
      render :text => "URL indisponível."
    end
  end

end