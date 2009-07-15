require 'hpricot'

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  doc = Hpricot(html_tag)
  elem = (doc/"/").first
  css_class = elem.attributes['class']
  css_class ||= ""
  css_array = css_class.split(" ")
  css_array << "fieldWithErrors"
  elem.attributes['class'] = css_array.uniq.join(" ")
  doc.to_s
end