class User < ApplicationRecord
  has_secure_password
  has_many :registrations
  has_many :events, through: :registrations
  has_many :hosting_events,  class_name: "Event", foreign_key:"user_id"
  validates :email, presence: true, uniqueness: true
end
