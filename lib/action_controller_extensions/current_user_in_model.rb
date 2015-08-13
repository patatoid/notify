module CurrentUserInModelActionControllerExtension
	extend ActiveSupport::Concern
  include AbstractController::Callbacks

	included do
		before_filter :set_current_user
	end
	
	protected
  def set_current_user
    ActiveRecord::Base.current_user = current_user
  end
end

ActionController::Base.send(:include, CurrentUserInModelActionControllerExtension)
