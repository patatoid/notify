class CreateNotificationTests < ActiveRecord::Migration
  def change
    create_table :notification_tests do |t|

      t.timestamps null: false
    end
  end
end
