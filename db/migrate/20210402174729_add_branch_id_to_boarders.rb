class AddBranchIdToBoarders < ActiveRecord::Migration[5.2]
  def change
    add_column(:boarders, :branch_id, :integer)
  end
end
