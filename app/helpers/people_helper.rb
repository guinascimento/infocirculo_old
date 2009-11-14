module PeopleHelper
	# Verify if user is trying to add himself as friend
	def is_you? user
		current_user.id == user.id
	end

	def pending_requests? user
		friendship = Friendship.find(:first, :conditions => "user_id = '#{user.id}'")
		if friendship != nil
			if friendship.pending?
				return true, friendship
			end
		end
	end

	def already_friends? user
		friendship = Friendship.find(:first, :conditions => "friend_id = '#{user.id}'")
		if friendship != nil
			friendship.accepted?
		end
	end

	def friendship_requested? user
		friendship = Friendship.find(:first, :conditions => "friend_id = '#{user.id}'")
		if friendship != nil
			friendship.requested?
		end
	end
end
