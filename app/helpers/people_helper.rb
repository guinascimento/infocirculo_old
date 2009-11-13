module PeopleHelper
	# Verify if user is trying to add himself as friend
	def is_you? user
		current_user.id == user.id
	end
	
	def already_friends? user
		friendship, status = current_user.be_friends_with(user)
		status == Friendship::STATUS_ALREADY_FRIENDS
	end

	def friendship_requested? user
		friendship, status = current_user.be_friends_with(user)
		puts status
		puts Friendship::STATUS_ALREADY_REQUESTED
		status == Friendship::STATUS_ALREADY_REQUESTED
	end
end
