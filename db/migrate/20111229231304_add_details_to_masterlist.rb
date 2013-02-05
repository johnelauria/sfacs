class AddDetailsToMasterlist < ActiveRecord::Migration
  def change
    add_column :masterlists, :transaction_id, :inter
    add_column :masterlists, :sy, :string
    add_column :masterlists, :student_id, :integer
    add_column :masterlists, :subject_id, :integer
  end
end
