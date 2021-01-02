class User < ApplicationRecord
    has_many :clientNotifications, dependent: :destroy
    validates_presence_of :email, :f_name, :l_name, :is_admin
end
