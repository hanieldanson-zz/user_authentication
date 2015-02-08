class CreateTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :username, :email, :password, :password_hash

    t.timestamps
    end

    add_index :users, :username
  end
end
