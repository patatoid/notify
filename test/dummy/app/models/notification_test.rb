class NotificationTest < ActiveRecord::Base
	notify :initialize, if: :test

	def test
		false
	end
end
