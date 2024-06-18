class Chat < ApplicationRecord
  belongs_to :user_opening_chat, class_name: 'User'
  belongs_to :user_destination_chat, class_name: 'User'

  has_many :chat_messages

  def other_user(current_user)
    User.find([user_opening_chat_id, user_destination_chat_id] - [current_user.id]).first
  end

  def self.paginate(params) = Pagination.run(self, params)
end
