class AddDeta2ilsToCashier < ActiveRecord::Migration
  def change
    add_column :cashiers, :fname, :text
    add_column :cashiers, :mname, :text
    add_column :cashiers, :lname, :text
    add_column :cashiers, :address, :string
    add_column :cashiers, :email, :string
    add_column :cashiers, :telnum, :integer
    add_column :cashiers, :celnum, :integer
  end
end
