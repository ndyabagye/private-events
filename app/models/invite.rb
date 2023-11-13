class Invite < ApplicationRecord
  enum status: { invited: 0, accepted: 1 }
  belongs_to :event
  belongs_to :user
  belongs_to :host, class_name: "User"
  belongs_to :invitee, class_name: "User"
end
