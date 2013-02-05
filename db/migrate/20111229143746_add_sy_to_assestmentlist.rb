class AddSyToAssestmentlist < ActiveRecord::Migration
  def change
    add_column :assestmentlists, :sy, :string
  end
end
