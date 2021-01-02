class Notification < ApplicationRecord
  has_many :clientNotifications, dependent: :destroy

  validates_presence_of :title, :body
end
