class AddRoomToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :room, :string
  end
end
