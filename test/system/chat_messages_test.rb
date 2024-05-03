require "application_system_test_case"

class ChatMessagesTest < ApplicationSystemTestCase
  setup do
    @chat_message = chat_messages(:one)
  end

  test "visiting the index" do
    visit chat_messages_url
    assert_selector "h1", text: "Chat messages"
  end

  test "should create chat message" do
    visit chat_messages_url
    click_on "New chat message"

    fill_in "Chats", with: @chat_message.chats_id
    fill_in "User send message id", with: @chat_message.user_send_message_id
    click_on "Create Chat message"

    assert_text "Chat message was successfully created"
    click_on "Back"
  end

  test "should update Chat message" do
    visit chat_message_url(@chat_message)
    click_on "Edit this chat message", match: :first

    fill_in "Chats", with: @chat_message.chats_id
    fill_in "User send message id", with: @chat_message.user_send_message_id
    click_on "Update Chat message"

    assert_text "Chat message was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat message" do
    visit chat_message_url(@chat_message)
    click_on "Destroy this chat message", match: :first

    assert_text "Chat message was successfully destroyed"
  end
end
