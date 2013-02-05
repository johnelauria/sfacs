class CreateActivitylogs < ActiveRecord::Migration
  def change
    create_table :activitylogs do |t|
      t.string :user
      t.string :activity

      t.timestamps
    end
  end
end
