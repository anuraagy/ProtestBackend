class Post < ApplicationRecord
  has_many :posts
  belongs_to :user
  belongs_to :movement

  validates :user,      :presence => true
  validates :content,   :presence => true
  validates :movement,  :presence => true
end
