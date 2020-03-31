class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :registrant, class_name: "User", foreign_key:"user_id"
  validates :rsvp, presence: true, inclusion: { in: %w(Yes No Maybe)}


  scope :affirmed,               -> { where(rsvp: "Yes") }


end
