class Subject < ActiveRecord::Base
		has_many :assestmentlists
	has_many :students, :through => :assestmentlists
	has_many :masterlists
	belongs_to :teacher
	

	
end
