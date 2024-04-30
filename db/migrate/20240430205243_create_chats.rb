class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats, id: :uuid do |t|
      t.references :user_opening_chat, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :user_destination_chat, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
