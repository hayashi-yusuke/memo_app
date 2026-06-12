  class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :memos
  has_many :liked_memos
  has_many :liked_memos, through: :likes, source: :memo
  has_one_attached :avatar

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end