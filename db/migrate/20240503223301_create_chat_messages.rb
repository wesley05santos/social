class CreateChatMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_messages, id: :uuid do |t|
      t.references :chats, null: false, foreign_key: true, type: :uuid
      t.references :user_send_message, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.text :message

      t.timestamps
    end
  end
end

