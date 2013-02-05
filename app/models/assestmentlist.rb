class Assestmentlist < ActiveRecord::Base
	belongs_to :student
	belongs_to :subject
	has_many :masterlists
	
end
