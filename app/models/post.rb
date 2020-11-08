class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, ->{order(created_at: :desc)}, dependent: :destroy


  # validates :image, presece: true
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      where(["decription LIKE?","%#{search}%"])
    else
      all
    end
  end

 
end
