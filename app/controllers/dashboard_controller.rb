class DashboardController < ApplicationController
	layout "application"
	before_filter :login_required

	def index
		dates = Hash["a", 100, "date", 25]
	end

end
