class GitUtil
	REMOTE = "origin"
	BRANCH_NAME = ARGV[0]

	def self.list_all_branches
		puts "\nListing all local branches"
		execute "git branch"
	end
	
	def self.push_remote_branch
		puts "\nPushing -> #{BRANCH_NAME}"
		execute "git push origin #{BRANCH_NAME}"
	end

	def self.delete_remote_branch
		puts "\nDeleting remote branch -> #{BRANCH_NAME}"
		execute "git push #{REMOTE} :#{BRANCH_NAME}"
	end
	
	def self.delete_local_branch
		puts "\nMoving to master branch"
		execute "git checkout master"

		puts "\nDeleting local branch -> #{BRANCH_NAME}"
		execute "git branch -D #{BRANCH_NAME}"
	end
	
	def self.execute cmd
		system cmd
	end
	
end

GitUtil.list_all_branches
GitUtil.delete_remote_branch
GitUtil.delete_local_branch

#GitUtil.push_remote_branch
