class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email, :set_default_name

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}, allow_nil: false
  validates :bio, length: {maximum: 128}
  validates :name, length: {maximum: 32}

  has_many :articles, dependent: :destroy

  def downcase_email
    email.downcase!
  end

  def set_default_name
    self.name = username if name.blank?
  end
end
