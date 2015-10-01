class AddStartToDrop < ActiveRecord::Migration
  def change
    add_column :drops, :start, :integer, default: 0
  end
end
