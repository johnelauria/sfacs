class Cashier < ActiveRecord::Base

	acts_as_authentic

	def fullname
		"#{fname} #{mname} #{lname}"
	end
	validates :fname, :presence =>true 
	validates :suffix, :presence =>true 
	validates :mname, :presence =>true
	validates :lname, :presence =>true
	
	validates :email, :presence =>true, :uniqueness => true
	validates :address, :presence =>true
	validates :telnum, :numericality=>true
	validates :celnum, :numericality=>true
end
