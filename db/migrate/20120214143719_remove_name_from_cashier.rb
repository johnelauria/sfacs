class RemoveNameFromCashier < ActiveRecord::Migration
  def up
    remove_column :cashiers, :name
  end

  def down
    add_column :cashiers, :name, :text
  end
end
