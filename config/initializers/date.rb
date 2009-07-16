ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :default => '%m/%d/%Y',
  :date_time12  => "%m/%d/%Y %I:%M%p",
  :date_time24  => "%m/%d/%Y %H:%M"
)