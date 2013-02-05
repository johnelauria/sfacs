class AddSuffixToStudinfo < ActiveRecord::Migration
  def change
    add_column :studinfos, :suffix, :text
  end
end
