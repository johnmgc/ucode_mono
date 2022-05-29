class CreatePublishes < ActiveRecord::Migration[7.0]
  def change
    create_table :publishes do |t|
      t.string :title
      t.text :content
      t.timestamp :published_at

      t.timestamps
    end
  end
end
