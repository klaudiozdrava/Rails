class DropConv < ActiveRecord::Migration[7.0]
  def change
    drop_table :private_conversations
    drop_table :private_messages
  end
end
