# rake rcov:cucumber

namespace :rcov do
  Cucumber::Rake::Task.new(:cucumber) do |t|
	t.rcov = true
	t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/ --aggregate coverage.data}
	t.rcov_opts << %[-o "coverage"]
	t.cucumber_opts = "--format pretty"
	rm "coverage.data" if File.exist?("coverage.data")
  end
end