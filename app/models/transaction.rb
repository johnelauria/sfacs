class Transaction < ActiveRecord::Base
	belongs_to :assestmentlist
	belongs_to :student
	belongs_to :subject
	has_many :payments ,:dependent => :destroy
	has_many :masterlists



	def totalamount
		subjectamount+ miscamount
	end
end
