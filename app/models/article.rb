class Article < ApplicationRecord
  validates :title, presence: true, length: {maximum: 256}
  validates :body, presence: true, length: {maximum: 4096}
  validates :cover_url, format: {with: URI::regexp(%w(http https)), message: "must be a valid URL"}, allow_blank: true
end
