class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name,null:false
      t.string :last_name,null:false
      t.string :username,null:false
      t.string :email,null:false
      t.text :studies
      t.string :password_digest

      t.timestamps
      add_index :users, :username, unique: true
    end
  end
end
