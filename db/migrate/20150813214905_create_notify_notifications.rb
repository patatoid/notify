class CreateNotifyNotifications < ActiveRecord::Migration
  def change
    create_table :notify_notifications do |t|
      t.string :user
      t.string :klass
      t.string :action
      t.string :result

      t.timestamps null: false
    end
  end
end
