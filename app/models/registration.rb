class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :registrant, class_name: "User", foreign_key:"user_id"
  validates :rsvp, inclusion: { in: %w(Yes No Maybe)}

=begin
  def self.rsvp_options
    yes = { :rsvp=>"Yes"}
    no = { :rsvp=>"No"}
    maybe = { :rsvp=>"Maybe"}
    return [yes, no, maybe]
  end
=end


end
