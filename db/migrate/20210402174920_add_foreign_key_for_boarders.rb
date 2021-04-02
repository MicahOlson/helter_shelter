class AddForeignKeyForBoarders < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :boarders, :branches
  end
end
