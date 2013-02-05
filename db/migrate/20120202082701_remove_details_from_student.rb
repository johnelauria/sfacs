class RemoveDetailsFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :fname
    remove_column :students, :studnum
    remove_column :students, :minitial
    remove_column :students, :lname
    remove_column :students, :level
    remove_column :students, :curri
    remove_column :students, :address
    remove_column :students, :telnum
    remove_column :students, :cellnum
  end

  def down
    add_column :students, :cellnum, :integer
    add_column :students, :telnum, :integer
    add_column :students, :address, :string
    add_column :students, :curri, :string
    add_column :students, :level, :string
    add_column :students, :lname, :text
    add_column :students, :minitial, :text
    add_column :students, :studnum, :integer
    add_column :students, :fname, :text
  end
end
