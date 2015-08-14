module Notify
	extend ActiveSupport::Concern
	
	def notify!(method, result)
		Notify::Notification.create(user: self.class.current_user, klass: self.class.name, action: method, result: result)
		logger.debug "#{self.class.current_user} : #{self.class} -> #{method} #=> #{result.inspect}"
	end

	class_methods do
		def notify(*methods)
			methods.each do |method|
				alias_method "#{method}_without_notification".to_sym, method
				define_method(method) do |*args|
					result = send("#{method}_without_notification", *args)
					notify!(method, result)
					result
				end
			end
		end
		def notifications
			Notify::Notification.where(klass: name)
		end
	end
end

ActiveRecord::Base.send(:include, Notify)
