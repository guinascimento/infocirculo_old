# == Schema Information
# Schema version: 20090807214936
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  user_type                 :string(255)
#  login                     :string(40)
#  name                      :string(100)     default("")
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  updated_at                :datetime
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  activation_code           :string(40)
#  activated_at              :datetime
#  password_reset_code       :string(40)
#  enabled                   :boolean(1)      default(TRUE)
#  identity_url              :string(255)
#  invitation_id             :integer(4)
#  invitation_limit          :integer(4)
#  cep                       :string(8)
#  professional_description  :string(255)
#  industry_id               :integer(4)
#  last_name                 :string(255)
#  avatar_file_name          :string(255)
#  avatar_content_type       :string(255)
#  avatar_file_size          :integer(4)
#  avatar_updated_at         :datetime
#

class OpenidUser < User
	validates_presence_of   :identity_url 
	validates_uniqueness_of :identity_url

	# Login with openid_identifier, only available to OpenidUsers
	# yield account?, user, message, error_item_msg, error_item_path
	def self.find_with_identity_url(identity_url, &block) 
		u = find :first, :conditions => ['identity_url = ?', identity_url] 
		case
		when (identity_url.blank? || u.nil?)
			yield false, nil, nil, nil, nil
		when !u.active?
			yield true, nil, "Your account has not been activated, please check your email or %s.", "request a new activation 				code", "resend_activation_path"
		when !u.enabled?
			yield true, nil, "Your account has been disabled, please %s.", "contact the administrator", "contact_site"
		else
			yield true, u, nil, nil, nil
		end	 
	end	

end
