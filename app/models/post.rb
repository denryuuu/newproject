class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :user_id, presence: true 
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
end
