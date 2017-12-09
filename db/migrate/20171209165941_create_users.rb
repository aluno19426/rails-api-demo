class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :api_key

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :api_key
  end
end