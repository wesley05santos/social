require 'rails_helper'

RSpec.describe '/api/v1/articles' do
  let(:user){ User.create(email: 'teste@teste.com', password: '123456') }
  let!(:article){ Article.create(title: 'Batata', content: 'Legume', user: user) }

  context 'GET :index' do
    it 'Renders a successfull response' do
      get api_v1_articles_path, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
    end

    it 'Returns articles array' do
      get api_v1_articles_path, headers: { 'ACCEPT' => 'application/json' }

      expected_result = {
        title: 'Batata',
        content: 'Legume',
        created_at: '13/06/2024',
        user: {
          email: user.email
        }
      }
      expect(response.body).to include(expected_result.to_json)
    end
  end

  context 'POST :create' do
    it 'Return Created Article' do
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
        created_at: '13/06/2024',
        user: {
          email: user.email
        }
      }
      expect(response.body).to eq(expected_result.to_json)
    end
  end

  context 'PUT :update' do
    it 'Return Updated Article' do
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
        created_at: '13/06/2024',
        user: {
          email: user.email
        }
      }
      expect(response.body).to eq(expected_result.to_json)
    end
  end

  context 'DELETE :destroy' do
    it 'Return Message Destroyed Article' do
      delete api_v1_article_path(article.id)
      expect(response.body).to include('Successfully Destroyed')
    end
  end
end
