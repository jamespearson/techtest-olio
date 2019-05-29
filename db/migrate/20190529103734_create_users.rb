class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :remote_id
      t.string :first_name
      t.string :avatar_url

      t.timestamps
    end
  end
end
