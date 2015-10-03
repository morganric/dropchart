class AddFeaturedToDrop < ActiveRecord::Migration
  def change
    add_column :drops, :featured, :boolean, default: false
  end
end
