class ChatMessage < ApplicationRecord
  belongs_to :chat
  belongs_to :user_send_message, class_name: 'User'
  after_create_commit { broadcast_prepend_to("chat_messages_channel_#{chat_id}", target: 'all_messages') }
end
