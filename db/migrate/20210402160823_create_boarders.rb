class CreateBoarders < ActiveRecord::Migration[5.2]
  def change
    create_table :boarders do |t|
      t.string :name
      t.string :kind
      t.string :breed
      t.string :gender
      t.integer :age
      t.string :description
      t.timestamps
    end
  end
end
