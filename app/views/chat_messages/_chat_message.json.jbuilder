json.extract! chat_message, :id, :chats_id, :user_send_message_id, :created_at, :updated_at
json.url chat_message_url(chat_message, format: :json)
