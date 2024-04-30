class Chat < ApplicationRecord
  belongs_to :user_opening_chat
  belongs_to :user_destination_chat
end
