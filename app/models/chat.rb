class Chat < ApplicationRecord
  belongs_to :user_opening_chat, class_name: 'User'
  belongs_to :user_destination_chat, class_name: 'User'
end
