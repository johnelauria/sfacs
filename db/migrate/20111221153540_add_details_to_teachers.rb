class AddDetailsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :crypted_password, :string
    add_column :teachers, :password_salt, :string
    add_column :teachers, :persistence_token, :string
  end
end
