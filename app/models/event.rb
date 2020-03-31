class Event < ApplicationRecord
  has_many :registrations
  #has_many :participants, through: :registrations, source: :user, class_name: "User", foreign_key:"user_id"
  has_many :registrants, through: :registrations
  belongs_to :host, class_name: "User", foreign_key:"user_id"
  validates :title, presence: true
  validates :location, presence: true
  validates :meeting_datetime , presence: true


  def isHost?(user)
    self.host==user
  end

# has the user registered for the event
  def registered(user)
    self.rsvped?(user) || self.isHost?(user)
  end

  def rsvped?(user)
     self.registrants.include?(user)
  end

  def registration(user)
    self.registrations.find_by(user_id: user.id)
  end

  def rsvp(user)
    registration = self.registration(user)
    registration.rsvp if registration
  end

  def upcoming_event?
    (self.meeting_datetime > Time.zone.now)
  end


  scope :past_events , -> { where("meeting_datetime < ?", Time.zone.now) }
  scope :upcoming_events , -> { where("meeting_datetime > ?", Time.zone.now) }



end
