class User < ApplicationRecord
  has_secure_password
  
  validates :email, 
    presence: true,
    uniqueness: true
    #length: {in: 6..20}

  validates :password, presence: true, length: { minimum: 6 }

  belongs_to :city, optional: true

  has_many :gossips

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
