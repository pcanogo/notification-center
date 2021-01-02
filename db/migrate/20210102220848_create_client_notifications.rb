class CreateClientNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :client_notifications do |t|
      t.references :user, foreign_key: true
      t.references :notification, foreign_key: true
      t.boolean :seen

      t.timestamps
    end
  end
end
