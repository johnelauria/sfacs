class AddDetailsToActivitylog < ActiveRecord::Migration
  def change
    add_column :activitylogs, :userid, :integer
  end
end
