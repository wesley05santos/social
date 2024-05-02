class ChatMessage < ApplicationRecord
  belongs_to :chats
  belongs_to :user_send_message
end
