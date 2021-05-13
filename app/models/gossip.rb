class Gossip < ApplicationRecord
  validates :title, 
    presence: true,
    length: {in: 3..14}

  validates :content, presence: true

  belongs_to :user, optional: true

  belongs_to :tag, optional: true

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy
end
