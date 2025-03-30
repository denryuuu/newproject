class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :user_id, presence: true 
  validates :tag_id, presence: true 
  belongs_to :user
  belongs_to :tag
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
