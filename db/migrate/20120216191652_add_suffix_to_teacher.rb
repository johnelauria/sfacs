class AddSuffixToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :suffix, :text
  end
end
