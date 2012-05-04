class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.text :message
      t.integer :notification_type_id
      t.integer :user_id
      t.integer :freind_id

      t.timestamps
    end
  end
end
