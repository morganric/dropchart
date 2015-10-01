class AddPlaysToDrop < ActiveRecord::Migration
  def change
    add_column :drops, :plays, :integer, default: 0
  end
end
