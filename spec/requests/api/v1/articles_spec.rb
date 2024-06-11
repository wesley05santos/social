require 'rails_helper'

RSpec.describe '/api/v1/articles' do
  let(:user){ User.create(email: 'teste@teste.com', password: '123456') }
  let!(:article){ Article.create(title: 'Batata', content: 'Legume', user: user) }

  context 'GET :index' do
    it 'Renders a successfull response' do
      get api_v1_articles_path
      expect(response).to be_successful
    end

    it 'Returns articles array' do
      get api_v1_articles_path
      expect(response.body).to include(article.to_json)
    end
  end
end
