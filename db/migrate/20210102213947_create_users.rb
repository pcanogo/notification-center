class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :f_name
      t.string :l_name
      t.boolean :is_admin

      t.timestamps
    end
  end
end
