class AddDetails422ToStudinfo < ActiveRecord::Migration
  def change
    add_column :studinfos, :level, :string
  end
end
