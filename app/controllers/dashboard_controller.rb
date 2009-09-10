class DashboardController < ApplicationController
	layout "application"
	before_filter :login_required

	def index
		@date = Time.parse("#{params[:start_date]} || Time.now.utc")
		@start_date = Date.new(@date.year, @date.month, @date.day)
		@events = Event.find(:all, :conditions => ['starts_at between ? and ?', @start_date, @start_date + 7])		
	end

	def push_notification
		render :text => Message.find_unread_messages(current_user)
	end
end