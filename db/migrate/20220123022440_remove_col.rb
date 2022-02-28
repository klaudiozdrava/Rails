class RemoveCol < ActiveRecord::Migration[7.0]
  def change
    remove_columns :posts, :attachment , :image
  end
end
