class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end