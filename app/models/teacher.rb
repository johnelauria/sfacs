class Teacher < ActiveRecord::Base
  acts_as_authentic
  has_many :subjects
  def fullname
    "#{fname} #{lname}"
  end
  validates :fname, :presence =>true 
	validates :suffix, :presence =>true 
	validates :mname, :presence =>true
	validates :lname, :presence =>true
	validates :level, :presence =>true
	validates :email, :presence =>true, :uniqueness => true
	validates :address, :presence =>true
	validates :telnum, :numericality=>true
	validates :celnum, :numericality=>true
end