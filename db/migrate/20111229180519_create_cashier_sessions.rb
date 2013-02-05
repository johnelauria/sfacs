class CreateCashierSessions < ActiveRecord::Migration
  def change
    create_table :cashier_sessions do |t|

      t.timestamps
    end
  end
end
