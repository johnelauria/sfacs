class AddInfosToCashier < ActiveRecord::Migration
	def change
    add_column :cashiers, :password_salt, :string
    add_column :cashiers, :persistence_token, :string
    add_column :cashiers, :name, :string
    add_column :cashiers, :staffnum, :string
  end
end
