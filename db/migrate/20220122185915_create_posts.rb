class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title
      t.text :content
      t.text :media

      t.timestamps
      add_attachment :posts, :image
    end
  end
end
