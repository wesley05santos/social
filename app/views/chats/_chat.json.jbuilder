json.extract! chat, :id, :user_opening_chat_id, :user_destination_chat_id, :created_at, :updated_at
json.url chat_url(chat, format: :json)
