class Post < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id, inverse_of: :posts

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :content, presence: true, length: { minimum: 5, maximum: 300 }

  scope :get_all_posts, -> { Post.includes(:creator).all }
end
