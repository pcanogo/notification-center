require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:clientNotifications).dependent(:destroy) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:f_name) }
    it { should validate_presence_of(:l_name) }
    it { should validate_presence_of(:is_admin) }
end