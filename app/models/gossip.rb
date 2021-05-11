class Gossip < ApplicationRecord
  validates :email, 
    presence: true,
    uniqueness: true,
    length: {in: 6..20}
  validates :content, presence: true
  belongs_to :user
  belongs_to :tag, optional: true
  has_many :likes
  has_many :comments, as: :comment_type
end
