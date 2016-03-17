class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:bildirimler]
	def index
		@users = User.text_search(params[:query]).page(params[:page]).per(10)
	end

	def bildirimler

	end
end
