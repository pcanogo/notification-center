class ClientNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  validates_presence_of :user_id, :notification_id, :seen
end
