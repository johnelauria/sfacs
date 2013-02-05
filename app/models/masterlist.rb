class Masterlist < ActiveRecord::Base
belongs_to :student
belongs_to :transaction
belongs_to :subject
belongs_to :grade
belongs_to :assestmentlists

end
