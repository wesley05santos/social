json.total_chats      @total_chats
json.data @chats do |chat|
  json.user_sender        chat.user_opening_chat.email
  json.user_destination   chat.user_destination_chat.email
  json.created_at         chat.created_at.strftime("%d/%m/%Y")
end
