class RemoveDetails2FromStudinfos < ActiveRecord::Migration
  def up
    remove_column :studinfos, :secret_question
    remove_column :studinfos, :secret_answer
  end

  def down
    add_column :studinfos, :secret_answer, :string
    add_column :studinfos, :secret_question, :string
  end
end
