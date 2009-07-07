class ProfileController < ApplicationController
  before_filter :login_required
  
  def index
    @profile = Curriculum.find_by_user_id(current_user.id) 
  end

end
