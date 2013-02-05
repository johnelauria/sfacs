class RemoveDetailFromTeachers < ActiveRecord::Migration
  def up
    remove_column :teachers, :password_digest
  end

  def down
    add_column :teachers, :password_digest, :string
  end
end
