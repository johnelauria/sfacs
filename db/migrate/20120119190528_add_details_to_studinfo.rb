class AddDetailsToStudinfo < ActiveRecord::Migration
  def change
    add_column :studinfos, :studnum, :integer
  end
end
