class CreateMiscellaneous < ActiveRecord::Migration
  def change
    create_table :miscellaneous do |t|
      t.text :name
      t.integer :amount

      t.timestamps
    end
  end
end
