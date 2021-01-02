require 'rails_helper'

RSpec.describe Notification, type: :model do
    it { should have_many(:clientNotifications).dependent(:destroy) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
end