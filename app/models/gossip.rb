class Gossip < ApplicationRecord
  validates :title, 
    presence: true,
    length: {in: 3..14}
  validates :content, presence: true
  belongs_to :user, optional: true
  belongs_to :tag, optional: true
  has_many :likes
  has_many :comments, as: :comment_type
end
