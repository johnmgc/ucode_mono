class AddcolumnUserIdToPublish < ActiveRecord::Migration[7.0]
  def change
    add_column :publishes, :usuario_id, :integer
  end
end
