require 'rails_helper'

RSpec.describe '/api/v1/chats' do
  let(:user_sender){ User.create(email: 'teste@teste.com', password: '123456') }
  let(:user_destination){ User.create(email: 'teste2@teste.com', password: '123456') }
  let!(:chat){ Chat.create(user_opening_chat: user_sender, user_destination_chat: user_destination) }

  context 'GET :index' do
    it 'Renders a successfull response' do
      get api_v1_chats_path, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
    end

    it 'Returns chats array' do
      get api_v1_chats_path, headers: { 'ACCEPT' => 'application/json' }

      expected_result = {
        user_sender: 'teste@teste.com',
        user_destination: 'teste2@teste.com',
        created_at: DateTime.current.strftime("%d/%m/%Y")
      }
      expect(response.body).to include(expected_result.to_json)
    end
  end
end
