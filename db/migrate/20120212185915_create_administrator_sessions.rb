class CreateAdministratorSessions < ActiveRecord::Migration
  def change
    create_table :administrator_sessions do |t|

      t.timestamps
    end
  end
end
