class AddDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :crypted_password, :string
    add_column :students, :password_salt, :string
    add_column :students, :persistence_token, :string
  end
end
