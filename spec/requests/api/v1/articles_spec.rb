require 'rails_helper'

RSpec.describe '/api/v1/articles' do
  let(:user){ User.create(email: 'teste@teste.com', password: '123456') }
  let!(:article){ Article.create(title: 'Batata', content: 'Legume', user: user) }
  before(:each, signed_in: true){ sign_in(user) }

  context 'Login' do
    it 'Login succesfully' do
      post api_v1_login_path, headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.password) }
      expect(response).to be_successful
    end
  end

  context 'Logout' do
    it 'Logout succesfully', signed_in: true do
      delete api_v1_logout_path(user)
      expect(response).to be_successful
      expect(response.body).to eq({message: 'Logout successfully'}.to_json)
    end
  end

  context 'GET :index' do
    it 'Renders a successfull response', signed_in: true do
      get api_v1_articles_path, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
    end

    it 'Returns articles array', signed_in: true do
      get api_v1_articles_path, headers: { 'ACCEPT' => 'application/json' }

      expected_result = {
        title: 'Batata',
        content: 'Legume',
        created_at: DateTime.current.strftime("%d/%m/%Y"),
        user: {
          email: user.email
        }
      }
      expect(response.body).to include(expected_result.to_json)
    end
  end

  context 'POST :create' do
    it 'Return Created Article', signed_in: true do
      post api_v1_articles_path, params: {
        article: {
          title: "Science",
          content: "The king Lion",
          user_id: user.id
        }
      },as: :json

      expected_result = {
        title: "Science",
        content: "The king Lion",
        created_at: DateTime.current.strftime("%d/%m/%Y"),
        user: {
          email: user.email
        }
      }
      expect(response.body).to eq(expected_result.to_json)
    end
  end

  context 'PUT :update' do
    it 'Return Updated Article', signed_in: true do
      put api_v1_article_path(article.id), params: {
        article: {
          title: "Science",
          content: "The king Lion",
          user_id: user.id
        }
      }, as: :json

      expected_result = {
        title: "Science",
        content: "The king Lion",
        created_at: DateTime.current.strftime("%d/%m/%Y"),
        user: {
          email: user.email
        }
      }
      expect(response.body).to eq(expected_result.to_json)
    end
  end

  context 'DELETE :destroy' do
    it 'Return Message Destroyed Article', signed_in: true do
      delete api_v1_article_path(article.id)
      expect(response.body).to include('Successfully Destroyed')
    end
  end
end
