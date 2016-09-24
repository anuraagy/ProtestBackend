class Movement < ApplicationRecord
  has_many :posts
  has_many :users

  validates :name,         :presence => true
  validates :description,  :presence => true
  validates :location,     :presence => true
  validates :status,       :presence => true
  validates :creator,      :presence => true
end
