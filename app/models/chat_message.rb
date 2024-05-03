class ChatMessage < ApplicationRecord
  belongs_to :chat
  belongs_to :user_send_message, class_name: 'User'
end
