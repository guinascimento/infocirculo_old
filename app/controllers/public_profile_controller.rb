class PublicProfileController < ApplicationController
  def cv
    name = params[:name]
    @user = find_curriculum_by_name(name)
  end
end
