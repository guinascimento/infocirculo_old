# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	FLASH_NOTICE_KEYS = [:error, :notice, :warning]

	def flash_message
		messages = ""
		FLASH_NOTICE_KEYS.each {|type|
	  		if flash[type]
				messages += "<p class=\"#{type}\">#{flash[type]}</p>"
	  		end
		}
		messages
	end

	def if_admin?
    yield if logged_in? && current_user.has_role?('admin')
	end
	
	def if_mensal?
		yield if logged_in? && current_user.has_role?('Mensal')
	end

	def if_logged_in?
		yield if logged_in?
	end

	def if_recaptcha?
		yield if @bad_visitor
	end

	def in_beta?
		APP_CONFIG['settings']['in_beta']
	end

	def if_in_beta?
		yield if in_beta?
	end

	def unless_in_beta?
		yield unless in_beta?
	end

	def if_invites_available?
		yield if in_beta? and logged_in? and (current_user.invitation_limit > 0)
	end

	def focus_on_div(div)
	  update_page do |page|
	    page[div].focus
	  end
    end


end
