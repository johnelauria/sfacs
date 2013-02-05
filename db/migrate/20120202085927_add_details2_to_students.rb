class AddDetails2ToStudents < ActiveRecord::Migration
  def change
    add_column :students, :studinfo_id, :integer
  end
end
