module DashboardHelper

  def full_name
    current_user.name + " " + current_user.last_name 
  end

end
