class RemoveDetailsFromMasterlist < ActiveRecord::Migration
  def up
    remove_column :masterlists, :assestmentlist_id
  end

  def down
    add_column :masterlists, :assestmentlist_id, :integer
  end
end
