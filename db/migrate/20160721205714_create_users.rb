class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :facebook_id
      t.string :facebook_token
      t.datetime :facebook_token_expires_at

      t.timestamps
    end
    add_index :users, :facebook_id
  end
end
