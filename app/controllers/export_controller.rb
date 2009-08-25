require "pdf/writer"

class ExportController < ApplicationController
	def pdf
		@profile = find_curriculum_from_user

		pdf = PDF::Writer.new
		pdf.text current_user.name + " " + current_user.last_name, :font_size => 23
		pdf.text @profile.user.professional_description + " - " + @profile.user.industry.name, :font_size => 12
		pdf.text @profile.user.email, :font_size => 12
		
		pdf.text "\n"
		pdf.text "Informacões Pessoais", :font_size => 14
		pdf.text "Telefone: " + @profile.phone, :font_size => 12
		pdf.text "Endereço: " + @profile.address, :font_size => 12
		#pdf.text "IM: " + full_im
		pdf.text "Estado Civil: " + @profile.maritial_status.to_s, :font_size => 12
	
		pdf.text "\n"
		pdf.text "Resumo", :font_size => 14
		pdf.text @profile.summary, :font_size => 12
		
		pdf.text "\n"
		pdf.text "Experiência Profissional", :font_size => 14

		@profile.experiences.each do |experience|
			pdf.text experience.title + " - " + experience.company_name, :font_size => 12
			pdf.text experience.start.strftime('%m/%Y') + " - " + experience.end.strftime('%m/%Y'), :font_size => 12
			pdf.text experience.description, :font_size => 12
			pdf.text "\n"
		end

		pdf.text "\n"
		pdf.text "Educação", :font_size => 14

		@profile.educations.each do |education|
			pdf.text education.degree.to_s + " - " + education.school_name, :font_size => 12
			
			if education.end != nil
				pdf.text education.start.strftime('%m/%Y') + " a " + education.end.strftime('%m/%Y'), :font_size => 12
			else
				pdf.text education.start.strftime('%m/%Y'), :font_size => 12
			end
			
			pdf.text education.activities, :font_size => 12
			pdf.text "\n"
		end

		pdf.text "\n"
		pdf.text "Idiomas", :font_size => 14
		
		@profile.idioms.each do |idiom|
			pdf.text idiom.name + " - " + idiom.degree.to_s, :font_size => 12
		end

		send_data pdf.render, :filename => "hello.pdf", :type => "application/pdf"
	end
end