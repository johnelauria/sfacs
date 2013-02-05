class AddDetails22ToStudinfo < ActiveRecord::Migration
  def change
    add_column :studinfos, :mname, :text
    add_column :studinfos, :address, :string
  end
end
