class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  after_create_commit { sleep(1); broadcast_append_to('articles_channel', target: 'all_articles') }
end
