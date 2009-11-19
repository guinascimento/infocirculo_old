module PeopleHelper
	# Verify if user is trying to add himself as friend
	def is_you? user
		current_user.id == user.id
	end

	def pending_requests? user
		friendship = Friendship.find(:all, :conditions => "user_id = '#{user.id}' AND status = 'pending'")
	end

	def pending_requests
		friendship = Friendship.find(:all, :conditions => "user_id = '#{current_user.id}' AND status = 'pending'")
	end

	def already_friends? user, friend
		friendship = Friendship.find(:first, :conditions => "user_id = '#{user.id}' AND friend_id = '#{friend.id}'")
		if friendship != nil
			friendship.accepted?
		end
	end

	def friendship_requestedd? user, friend
		friendship = Friendship.find(:first, :conditions => "user_id = '#{user.id}' AND friend_id = '#{friend.id}'")
		if friendship != nil
			friendship.requested?
		end
	end
end
