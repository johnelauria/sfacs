class CreateStudentSessions < ActiveRecord::Migration
  def change
    create_table :student_sessions do |t|

      t.timestamps
    end
  end
end
