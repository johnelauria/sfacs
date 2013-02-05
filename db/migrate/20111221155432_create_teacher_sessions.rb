class CreateTeacherSessions < ActiveRecord::Migration
  def change
    create_table :teacher_sessions do |t|

      t.timestamps
    end
  end
end
