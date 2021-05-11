class User < ApplicationRecord
  validates :email, 
    presence: true,
    uniqueness: true
    #length: {in: 6..20}
  belongs_to :city, optional: true
  has_many :gossips
  has_many :likes
  has_many :comments, as: :comment_type
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
