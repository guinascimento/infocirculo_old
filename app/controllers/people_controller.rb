class PeopleController < ApplicationController
	def index
		#@people = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
		@people = User.find(:all)
	end

	def show
		@profile = find_curriculum_by_id params[:id]
	end

	def search
		if params[:a] != ""
			query = params[:a]
		end
		if params[:b] != ""
			query = params[:b]
		end
		puts query
		results = SiteUser.search query
		@people  = results.docs
		@total_hits = results.total_hits

		puts results.docs
		puts @total_hits

		render :template => "people/index"
	end

	def request_connection
		friendship, status = current_user.be_friends_with(User.find(params[:id]))

		# Who is sending the friend request
		user = User.find(friendship.friend_id)

		# The user that can be a friend
		friend = User.find(friendship.user_id)

		if status == Friendship::STATUS_REQUESTED
			UserMailer.deliver_friendship_request(user, friend)
		end
	end

	def remove_connection
		# The friend that will be removed
		friend = User.find(params[:id])

		current_user.remove_friendship_with(friend)
	end
end
