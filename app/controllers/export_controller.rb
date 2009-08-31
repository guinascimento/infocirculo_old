require "pdf/writer"
	 
class ExportController < ApplicationController
	def pdf
		@profile = find_curriculum_from_user

		pdf = PDF::Writer.new
		pdf.text convert_encoding(current_user.name + " " + current_user.last_name), :font_size => 23
		pdf.text @profile.user.professional_description + " - " + @profile.user.industry.name, :font_size => 10
		pdf.text @profile.user.email, :font_size => 10
		
		pdf.text "\n"
		pdf.text convert_encoding("Informações Pessoais"), :font_size => 13, :style => :bold
		pdf.text "Telefone: " + @profile.phone, :font_size => 10
		pdf.text convert_encoding("Endereço: " + @profile.address), :font_size => 10
		pdf.text "IM: " + full_im(@profile)
		pdf.text convert_encoding("Estado Civíl: " + @profile.maritial_status.to_s), :font_size => 10
	
		pdf.text "\n"
		pdf.text "Resumo", :font_size => 13, :style => :bold
		pdf.text convert_encoding(@profile.summary), :font_size => 10
		
		pdf.text "\n"
		pdf.text convert_encoding("Experiência Profissional"), :font_size => 13, :style => :bold

		@profile.experiences.each do |experience|
			pdf.text convert_encoding(experience.title + " - " + experience.company_name), :font_size => 10
			pdf.text convert_encoding(experience.start.strftime('%m/%Y') + " - " + experience.end.strftime('%m/%Y')), :font_size => 10
			pdf.text convert_encoding(experience.description), :font_size => 10
			pdf.text "\n"
		end

		pdf.text convert_encoding("Educação"), :font_size => 13, :style => :bold

		@profile.educations.each do |education|
			pdf.text convert_encoding(education.degree.to_s + " - " + education.school_name), :font_size => 10
			
			if education.end != nil
				pdf.text education.start.strftime('%m/%Y') + " a " + education.end.strftime('%m/%Y'), :font_size => 10
			else
				pdf.text education.start.strftime('%m/%Y'), :font_size => 10
			end
			
			pdf.text convert_encoding(education.activities), :font_size => 10
			pdf.text "\n"
		end

		pdf.text "Idiomas", :font_size => 13, :style => :bold
		
		@profile.idioms.each do |idiom|
			pdf.text convert_encoding(idiom.name + " - " + idiom.degree.to_s), :font_size => 10
		end

		send_data pdf.render, :filename => "#{@profile.user.name.downcase}_cv.pdf", :type => "application/pdf"
	end
	
	def full_im profile
		case profile.im_type
			when :MSN
				profile.im + " (MSN)"
			when :AIM
				profile.im + " (AIM)"
			when :GTalk
				profile.im + " (GTalk)"
			when :Skype
				profile.im + " (Skype)"
		end
	end

	def convert_encoding text
		Iconv.conv('ISO-8859-1', 'utf-8', text)
	end
end