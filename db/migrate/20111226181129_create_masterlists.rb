class CreateMasterlists < ActiveRecord::Migration
  def change
    create_table :masterlists do |t|
      t.integer :assestmentlist_id

      t.timestamps
    end
  end
end
