class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :sign_ups, foreign_key: :event_attended_id
  has_many :attendees, through: :sign_ups
end
