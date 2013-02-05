class AddMoredetailsToMasterlist < ActiveRecord::Migration
  def change
    add_column :masterlists, :grade_id, :integer
  end
end
