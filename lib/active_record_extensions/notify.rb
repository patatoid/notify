module Notify
	extend ActiveSupport::Concern
	
	def notify!(method, result)
		Notify::Notification.create(user: self.class.current_user, klass: self.class.name, action: method, result: result)
	end

	class_methods do
		def notify(*methods)
			options = methods.extract_options!
			methods.each do |method|
				alias_method "#{method}_without_notification".to_sym, method
				define_method(method) do |*args|
					result = send("#{method}_without_notification", *args)
					if options[:if]
						notify!(method, result) if (send(options[:if].to_s))
					elsif options[:unless]
						notify!(method, result) unless (send(options[:unless].to_s))
					else
						notify!(method, result)
					end
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
