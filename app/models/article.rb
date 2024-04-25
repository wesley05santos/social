class Article < ApplicationRecord
  belongs_to :user
  after_create_commit { broadcast_append_to('articles_channel', target: 'all_articles') }
end
