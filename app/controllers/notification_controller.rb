class NotificationController < ApplicationController
	def index
		@messages = Message.where('recipient_id=?', current_user.id)
  end
end
