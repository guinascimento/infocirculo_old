# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	FLASH_NOTICE_KEYS = [:error, :notice, :warning]

	def flash_message
		messages = ""
		FLASH_NOTICE_KEYS.each {|type|
	  		if flash[type]
                messages += "<div id='flash_messages'>"
				messages += "<p class=\"#{type}\">#{flash[type]}</p>"
                messages += "</div>"
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

    def is_active?(controller_name)
      "current" if params[:controller] == controller_name
    end

    # Used to apply HTML formatting rules to text_area element
    def format_text_area(text, html_options={})
      start_tag = tag('li', html_options, true)
      text = text.to_s.dup
      text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
      text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")  # 2+ newline  -> paragraph
      text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
      text.insert 0, start_tag
      text << "</li>"
  end
  
  def full_name
		current_user.name + " " + current_user.last_name 
  end

	def full_im
		case @profile.im_type
			when :MSN
	  		@profile.im + " (MSN)"
			when :AIM
	  		@profile.im + " (AIM)"
			when :GTalk
	  		@profile.im + " (GTalk)"
			when :Skype
	  		@profile.im + " (Skype)"
  	end
	end
end