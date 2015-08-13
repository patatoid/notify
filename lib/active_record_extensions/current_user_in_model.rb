module CurrentUserInModelActiveRecordExtension
	extend ActiveSupport::Concern

	class_methods do
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end
end

ActiveRecord::Base.send(:include, CurrentUserInModelActiveRecordExtension)
