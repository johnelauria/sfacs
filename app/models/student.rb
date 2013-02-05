class Student < ActiveRecord::Base
	acts_as_authentic

	has_many :assestmentlists, :dependent => :destroy
	has_many :subjects, :through => :assestmentlists
	has_many :masterlists , :dependent => :destroy
	has_many :transactions, :dependent => :destroy
	belongs_to :studinfo

	

	
	

validates :username, :presence =>true, :uniqueness => true 





end
