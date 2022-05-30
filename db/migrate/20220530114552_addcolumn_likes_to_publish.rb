class AddcolumnLikesToPublish < ActiveRecord::Migration[7.0]
  def change
    add_column :publishes, :likes, :integer, :default => 0
    add_column :publishes, :dislikes, :integer, :default => 0
  end
end
