class House < ActiveRecord::Base
	acts_as_solr :fields => [:name]
end
