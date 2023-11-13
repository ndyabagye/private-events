class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :invites
  has_many :attended_events, through: :invites, source: :event

  has_many :invited_users, foreign_key: "host_id", class_name: "Invite"
  has_many :invitees, through: :invited_users

  has_many :hosted_users, foreign_key: "invitee_id", class_name: "Invite"
  has_many :hosts, through: :hosting_users
end
