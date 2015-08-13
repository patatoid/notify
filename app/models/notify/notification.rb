module Notify
  class Notification < ActiveRecord::Base
		serialize :user
		serialize :result		
  end
end
