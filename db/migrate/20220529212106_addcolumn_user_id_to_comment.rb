class AddcolumnUserIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :usuario_id, :integer
  end
end
