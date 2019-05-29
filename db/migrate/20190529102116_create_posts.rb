class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :remote_id
      t.string :title
      t.string :description
      t.string :collection_notes
      t.integer :status
      t.datetime :expires_at
      t.integer :remote_like_count
      t.string :image_url

      t.timestamps
    end
  end
end
