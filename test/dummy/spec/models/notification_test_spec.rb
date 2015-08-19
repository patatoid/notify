require 'rails_helper'

RSpec.describe NotificationTest, type: :model do
	it "creates a notification on setted callback" do
		@nt = NotificationTest.new
		@nt.class.send(:notify, :new)
		@nt.new
		expect(@nt.notifications.first).to exist
	end
end
