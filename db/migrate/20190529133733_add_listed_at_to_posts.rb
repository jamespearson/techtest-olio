class AddListedAtToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :listed_at, :datetime, index: true
  end
end
