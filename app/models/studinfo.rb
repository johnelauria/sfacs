class Studinfo < ActiveRecord::Base
	has_one :student
	def fullname
		"#{fname} #{mname}. #{lname}"
	end
	validates :fname, :presence =>true 
	validates :suffix, :presence =>true 
	validates :mname, :presence =>true
	validates :lname, :presence =>true
	validates :level, :presence =>true
	validates :email, :presence =>true, :uniqueness => true
	validates :address, :presence =>true
end
