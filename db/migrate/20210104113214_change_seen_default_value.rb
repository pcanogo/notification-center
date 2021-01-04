class ChangeSeenDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:client_notifications, :seen, false) 
  end
end
