class Api::V1::ChatsController < Api::V1::ApplicationController
  def index
    @chats =  Chat.all
    @total_chats = Chat.count
  end
end
