class UsersController < ApplicationController
	def index
		@users = User.text_search(params[:query]).page(params[:page]).per(10)
	end
end
