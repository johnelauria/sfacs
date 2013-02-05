class AddEmailToStudinfo < ActiveRecord::Migration
  def change
    add_column :studinfos, :email, :string
  end
end
