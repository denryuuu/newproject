class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar 
  has_many :posts, dependent: :destroy
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "無効なメールアドレスです" }
  validates :reset_password_token, uniqueness: true, allow_nil: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  def like(post)
    like_posts << post unless like?(post)
  end
  
  def unlike(post)
    like_posts.destroy(post)
  end
  
  def like?(post)
    like_posts.include?(post)
  end

  def own?(post)
    id == post.user_id
  end
  
end
