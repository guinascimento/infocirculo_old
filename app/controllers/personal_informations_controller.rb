class PersonalInformationsController < ApplicationController
  before_filter :login_required

  def new
    @curriculum = Curriculum.new    
  end

  
end
