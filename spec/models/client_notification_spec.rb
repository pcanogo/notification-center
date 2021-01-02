require 'rails_helper'

RSpec.describe ClientNotification, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:notification) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:notification_id) }
  it { should validate_presence_of(:seen) }
end
