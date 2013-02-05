class AddDcToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :discount, :integer
  end
end
