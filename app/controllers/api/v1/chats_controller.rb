class Api::V1::ChatsController < ActionController::API
  def index
    @chats =  Chat.all
    @total_chats = Chat.count
  end
end
