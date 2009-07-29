class PublicProfileController < ApplicationController
  def cv
    name = params[:name]
    @user = find_user_by_name(name)
  end
end
