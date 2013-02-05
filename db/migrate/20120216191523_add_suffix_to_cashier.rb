class AddSuffixToCashier < ActiveRecord::Migration
  def change
    add_column :cashiers, :suffix, :text
  end
end
