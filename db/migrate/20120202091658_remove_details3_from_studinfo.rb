class RemoveDetails3FromStudinfo < ActiveRecord::Migration
  def up
    remove_column :studinfos, :minitial
  end

  def down
    add_column :studinfos, :minitial, :text
  end
end
